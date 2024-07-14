#include <cs50.h>
#include <stdio.h>

void meow(int n);
int main(void)
{
    int k = get_int("How Many Meows...");
    for(int n=k; n>0; n--)
    {
        meow(n);
    }
}

void meow(int n)
{
    printf("meow\n");
}

