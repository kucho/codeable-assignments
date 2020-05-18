#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cs50.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    char *str_key = argv[1];
    // Check if the characters are valid
    if (strspn(str_key, "0123456789") != strlen(str_key))
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    // convert to real int key
    int key = atoi(str_key);

    char *text = "";
    // Validate the message
    text = get_string("plaintext: ");

    char c = "";

    // While is not the end and not null
    for (int i = 0; i < strlen(text); i++)
    {
        c = text[i];
        // If it is uppercase
        if (isupper(c))
        {
            text[i] = (c + key - 'a') % 26 + 'a';
        }
        // If it is lowercase
        if (islower(c))
        {
            text[i] = (c + key - 'A') % 26 + 'A';
        }
    }

    // Output transformed text
    printf("ciphertext: %s\n", text);

    return 0;
}