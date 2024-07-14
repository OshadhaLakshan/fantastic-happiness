#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool only_digits(string s);
char rotate(char c, int n);

int main(int argc, string argv[])
{
    if (argc == 2 && only_digits(argv[1]))
    {
        int key = atoi(argv[1]);

        if (key >= 0 && key < 26)
        {
            key = atoi(argv[1]);
        }
        else
        {
            key = key % 26;
        }

        string plain = get_string("plaintext:  ");
        printf("ciphertext: ");

        for (int i = 0, j = strlen(plain); i < j; i++)
        {
            printf("%c", rotate(plain[i], key));
        }
        printf("\n");
        return 0;
    }
    else
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
}

bool only_digits(string s)
{
    int j = strlen(s), k = 0;

    for (int i = 0 ; i < j; i++)
    {
        if (isdigit(s[i]))
        {
            k++;
        }
    }

    return (k == j) ? true : false;
}

char rotate(char c, int n)
{
    if (isalpha(c))
    {
        c += n;
        if (isalpha(c))
        {
            return c;
        }
        else
        {
            c -= 26;
            return c;
        }
    }
    else
    {
        return c;
    }
}
