#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <cs50.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./substitution 26-char-key\n");
        return 1;
    }

    string key = argv[1];

    if (strlen(key) != 26)
    {
        printf("Usage: ./substitution 26-char-key\n");
        return 1;
    }

    for (int i = 0; i < strlen(key); i++)
    {
        if (isalpha(key[i]) == 0)
        {
            printf("Key must only contain alphabetic characters.\n");
            return 1;
        }

        // If its lowercase, make it uppercase
        if (islower(key[i]))
        {
            key[i] = toupper(key[i]);
        }

        for (int j = 0; j < i; j++)
        {
            // If they keys are duplicated, exit
            if (key[i] == key[j])
            {
                printf("Key must not contain repeated characters.\n");
                return 1;
            }

        }
    }

    string text = get_string("plaintext: ");
    char c;

    for (int i = 0; i < strlen(text); i++)
    {
        c = text[i];
        // If it is uppercase
        if (isupper(c))
        {
            text[i] = key[(c - 'A')];
        }
        // If it is lowercase
        if (islower(c))
        {
            // Get the new value and make it lowercase
            text[i] = tolower(key[(c - 'a')]);
        }
    }

    // Output transformed text
    printf("ciphertext: %s\n", text);

    return 0;
}