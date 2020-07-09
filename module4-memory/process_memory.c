#include <stdio.h>
#include <stdlib.h>

extern char etext, edata, end; 

int data_initialized = 1;
int data_uninitialized;

int main(int argc, char *argv[], char *envp[])
{
    int i = 0;
    int *ptr;

    ptr = (int*) malloc(sizeof(int));
    if (ptr == NULL)
    {
        printf("malloc error");
        exit(-1);
    }

    printf("First address past:\n");
    printf("    program text (etext)      %10p\n", &etext);
    printf("    initialized data (edata)  %10p\n", &edata);
    printf("    uninitialized data (end)  %10p\n", &end);

    printf("sample code address\t%10p\n", &main);
    printf("sample initialized variable address\t%10p\n", &data_initialized);
    printf("sample uninitialized variable address\t%10p\n", &data_uninitialized);
    printf("sample heap variable address\t\t%10p\n", ptr);
    printf("sample stack variable address\t\t%10p\n", &i);
    printf("sample argument variable address\t%10p\n", argv);
    
    sleep(10);

    exit(EXIT_SUCCESS);
}
