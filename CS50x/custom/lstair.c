#include <cs50.h>
#include <stdio.h>

void print(int l);
int main(void)
{
    int h = get_int("Height...");

    for(int i=0; i<h; i++)
    {
        print(i+1);
    }
}

void print(int l)
{
    for(int i=0; i<l; i++)
    {
        printf("#");
    }
    printf("\n");
}
