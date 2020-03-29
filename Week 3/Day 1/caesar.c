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
    while (*text == '\0' || *text == '\40')
    {
        text = get_string("plaintext: ");
    }

    char *c = "";
    int i = 0;

    // While is not the end and not null
    while (text[i] != '\0')
    {
        c = &text[i];
        // If it is uppercase
        if (*c >= 65 && *c <= 90)
        {
            text[i] = (*c + key - 65) % 26 + 65;
        }
        // If it is lowercase
        if (*c >= 97 && *c <= 122)
        {
            text[i] = (*c + key - 97) % 26 + 97;
        }
        i++;
    }

    // Output transformed text
    printf("ciphertext: %s\n", text);

    return 0;
}