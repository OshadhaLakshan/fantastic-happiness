#include <cs50.h>
#include <stdio.h>

float div(float x, float y);
int main(void)
{
    float x = get_float("What is X?...");
    float y = get_float("What is Y?...");

    printf("X / Y is...%.50f\n", div(x, y));
}

float div(float x, float y)
{
    return x / y;
}
