#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <cs50.h>

int main(void)
{

    string text = "";
    // Validate the input
    while (strlen(text) < 1)
    {
        text = get_string("Text: ");
    }

    int letter_count = 0;
    int word_count = 1;
    int sentence_count = 0;
    int len = strlen(text);

    for (int i = 0; i < len; i++)
    {
        char c = text[i];
        // Check if the character is a-z or A-Z
        if (isalpha(c) != 0)
        {
            letter_count++;
        }
        // Check if the character is a space
        if (isspace(c) != 0)
        {
            word_count++;
        }
        // Check if the character is '!', '.' or '?' using ASCII codes
        if (c == '\41' || c == '\56' || c == '\77')
        {
            sentence_count++;
        }

    }
    // Cast the variables to avoid losing decimals
    float L = (float)letter_count * 100 / (float)word_count;
    float S = (float)sentence_count * 100 / (float)word_count;
    // Do the math and round the result
    int index = round(0.0588 * L - 0.296 * S - 15.8);

    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index < 16)
    {
        printf("Grade %i\n", index);
    }
    else
    {
        printf("Grade 16+\n");
    }

}