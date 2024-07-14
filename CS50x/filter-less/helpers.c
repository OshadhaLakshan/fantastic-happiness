#include "helpers.h"
#include <math.h>

void average(BYTE *Red, BYTE *Green, BYTE *Blue);
void oldvalue(BYTE *Red, BYTE *Green, BYTE *Blue);
void swap(RGBTRIPLE *a, RGBTRIPLE *b);

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Take average of red, green, and blue
            average(&image[i][j].rgbtRed, &image[i][j].rgbtGreen, &image[i][j].rgbtBlue);
        }
    }
    return;
}

void average(BYTE *Red, BYTE *Green, BYTE *Blue)
{
    double avg = round((*Red + *Green + *Blue) / 3.0);

    // Update pixel values
    *Red = avg;
    *Green = avg;
    *Blue = avg;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Compute sepia values
            oldvalue(&image[i][j].rgbtRed, &image[i][j].rgbtGreen, &image[i][j].rgbtBlue);
        }
    }
    return;
}

void oldvalue(BYTE *originalRed, BYTE *originalGreen, BYTE *originalBlue)
{
    double sepiaRed = round(.393 * *originalRed + .769 * *originalGreen + .189 * *originalBlue);
    double sepiaGreen = round(.349 * *originalRed + .686 * *originalGreen + .168 * *originalBlue);
    double sepiaBlue = round(.272 * *originalRed + .534 * *originalGreen + .131 * *originalBlue);

    // Update pixel with sepia values
    // Clamp the values to be within 0-255
    *originalRed = (sepiaRed > 255) ? 255 : sepiaRed;
    *originalGreen = (sepiaGreen > 255) ? 255 : sepiaGreen;
    *originalBlue = (sepiaBlue > 255) ? 255 : sepiaBlue;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width / 2; j++)
        {
            int z = width - j - 1;
            // Swap pixels
            swap(&image[i][j], &image[i][z]);
        }
    }
    return;
}

void swap(RGBTRIPLE *a, RGBTRIPLE *b)
{
    RGBTRIPLE tmp = *a;
    *a = *b;
    *b = tmp;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Create a copy of the image
    RGBTRIPLE copy[height][width];
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    // Apply blur effect
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
            int count = 0;

            // Loop through the 3x3 grid centered at the current pixel
            for (int di = -1; di <= 1; di++)
            {
                for (int dj = -1; dj <= 1; dj++)
                {
                    int ni = i + di;
                    int nj = j + dj;

                    // Check if the neighboring pixel is within the image boundaries
                    if (ni >= 0 && ni < height && nj >= 0 && nj < width)
                    {
                        sumRed += copy[ni][nj].rgbtRed;
                        sumGreen += copy[ni][nj].rgbtGreen;
                        sumBlue += copy[ni][nj].rgbtBlue;
                        count++;
                    }
                }
            }

            // Calculate the average color values and round to the nearest integer
            image[i][j].rgbtRed = round((float) sumRed / count);
            image[i][j].rgbtGreen = round((float) sumGreen / count);
            image[i][j].rgbtBlue = round((float) sumBlue / count);
        }
    }
    return;
}
