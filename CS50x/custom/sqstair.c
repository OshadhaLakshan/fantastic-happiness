#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int n = get_int("Height of the StairCase...");
    for(int i=0; i<n; i++)
    {
        for(int j=-1; j<i; j++)
        {
            printf("#");
        }
    printf("\n");
    }
}
