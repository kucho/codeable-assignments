#include <stdio.h>
#include <cs50.h>
#define MIN_SIZE 13
#define MAX_SIZE 16

int main(void)
{

    long number = 0;

    // Validate the number
    while (number <= 0)
    {
        number = get_long("Number: ");
    }

    int digits_count = 0;
    long num = number; // Disposable variable to count digits
    int sum_even = 0;
    int sum_odd = 0;
    int first_number = 0;
    int second_number = 0;

    do
    {
        // Increment digit count
        digits_count++;

        int digit = num % 10;

        // If it is even, multiply it by 2
        if (digits_count % 2 == 0)
        {
            if (digit * 2 >= 10)
            {
                sum_even += 1 + (digit * 2 - 10);
            }
            else
            {
                sum_even += digit * 2;
            }
        }
        else // If it is odd, just sum
        {
            sum_odd += digit;
        }
        // Remove last digit of 'num'
        num /= 10;

        // Save if these are the last two
        if (num >= 10)
        {
            first_number = num / 10;
            second_number = num % 10;
        }
    } while (num != 0);

    // If size is invalid, exit
    if (digits_count < MIN_SIZE || digits_count > MAX_SIZE)
    {
        printf("INVALID\n");
        return 0;
    }

    // Final validation of the checksum
    if ((sum_odd + sum_even) % 10 != 0)
    {
        printf("INVALID\n");
        return 0;
    }

    // Check if the provider is listed
    switch (first_number)
    {
    case 3:
        if (second_number == 4 || second_number == 7)
        {
            printf("AMEX\n");
        }
        else
        {
            printf("INVALID\n");
        }
        break;

    case 4:
        printf("VISA\n");
        break;

    case 5:
        if (second_number >= 1 && second_number <= 5)
        {
            printf("MASTERCARD\n");
        }
        else
        {
            printf("INVALID\n");
        }
        break;

    default:
        printf("INVALID\n");
        break;
    }
}