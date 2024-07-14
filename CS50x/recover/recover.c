#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    // Accept a single command-line argument
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open the memory card
    FILE *card = fopen(argv[1], "r");

    // Create a buffer for a block of data
    uint8_t buffer[512];

    // File pointer for the output JPEG
    FILE *img = NULL;

    // Filename buffer
    char filename[8];

    // JPEG file counter
    int file_count = 0;

    // Flag to indicate if we are writing a JPEG
    bool writing_jpeg = false;

    // While there's still data left to read from the memory card
    while (fread(buffer, 1, 512, card) == 512)
    {
        // Check if the block indicates the start of a new JPEG
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&
            (buffer[3] & 0xf0) == 0xe0)
        {
            // If already writing a JPEG, close the previous file
            if (writing_jpeg)
            {
                fclose(img);
            }

            // Create a new filename for the new JPEG
            sprintf(filename, "%03d.jpg", file_count++);

            // Open a new JPEG file
            img = fopen(filename, "w");
            if (img == NULL)
            {
                printf("Could not create file %s.\n", filename);
                fclose(card);
                return 1;
            }

            // Indicate that we are now writing a JPEG
            writing_jpeg = true;
        }

        // If we are currently writing to a JPEG file, write the buffer to it
        if (writing_jpeg)
        {
            fwrite(buffer, 1, 512, img);
        }
    }

    // Close any remaining files
    if (img != NULL)
    {
        fclose(img);
    }

    fclose(card);
    return 0;
}
