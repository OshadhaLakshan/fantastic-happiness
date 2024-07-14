#include <stdio.h>
#include <cs50.h>

int main(void)
{
    char c = get_char("Do you Agree? (y/n)...");

    if (c == 'y')
    {
        printf("Agreed...!\n");
    }

    else if (c == 'n')
    {
        printf("Disagreed...!\n");
    }

    else
    printf("INVALID INPUT\n");
}
