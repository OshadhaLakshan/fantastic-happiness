#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

string capitalize(string input);
int marks(string phrase);

int main(void)
{
    string word[2];

    word[0] = get_string("Player 1: ");
    word[1] = get_string("Player 2: ");

    word[0] = capitalize(word[0]);
    word[1] = capitalize(word[1]);

    int mark1 = marks(word[0]);
    int mark2 = marks(word[1]);

    if (mark1 > mark2)
    {
        printf("Player 1 wins!\n");
    }
    else if (mark1 < mark2)
    {
        printf("Player 2 wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
}

string capitalize(string input)
{
    int length = strlen(input);
    string output = input;

    for (int i = 0; i < length; i++)
    {
        output[i] = toupper(input[i]);
    }

    return output;
}

int marks(string phrase)
{
    int mark = 0,
        cap[26] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
    int length = strlen(phrase);

    for (int i = 0; i < length; i++)
    {
        if (phrase[i] >= 'A' && phrase[i] <= 'Z')
        {
            int j = phrase[i] - 65;
            mark = mark + cap[j];
        }
    }

    return mark;
}
