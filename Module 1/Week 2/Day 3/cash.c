#include <stdio.h>
#include <cs50.h>
#include <math.h>

int change_counter(int change)
{
    int count = 0;

    int coins[4] = {25, 10, 5, 1};

    int coins_size = sizeof(coins) / sizeof(coins[0]);

    // We check for every coin notation
    for (int i = 0; i < coins_size; i++)
    {
        // If we can give it, do it!
        if (change >= coins[i])
        {
            count += change / coins[i];
            change -= (change / coins[i]) * coins[i];
        }
    }
    return count;
}

int main(void)
{
    float change = 0;

    // Do it indefinitely
    while (change <= 0)
    {
        // Ask the change owed
        change = get_float("Change owed: ");
    }

    int change = (int)round(change * 100.0);

    int minimo = change_counter(change);

    printf("%i\n", minimo);
}