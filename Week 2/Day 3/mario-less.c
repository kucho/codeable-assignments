#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Define variables
    int height;

    // Do it while is not valid
    while (height <= 0 || height > 8)
    {
        // Ask height
        height = get_int("Height: ");
    }

    // For each row
    for (int i = 0; i < height; i++)
    {
        // For each column
        for (int j = 0; j < height; j++)
        {
            // Complement
            int com = height - i - 1;
            // Pick character
            if (j < com)
            {
                printf(" ");
            }
            else
            {
                printf("#");
            }
        }
        printf("\n");
    }
}