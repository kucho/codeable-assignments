#include <stdio.h>
#include <cs50.h>

int main(void)
{
    // Ask the name
    string name = get_string("Your name: ");
    // Print result
    printf("hello, %s\n", name);
}