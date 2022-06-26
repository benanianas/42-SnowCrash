#include <stdio.h>


int main(int argc, char **argv)
{
    if(argc == 2)
    {
        int i = 0;
        while(argv[1][i] != '\0')
        {
            printf("%c", argv[1][i]-i);
            i++;
        }
        printf("\n");
    }
}