#include <stdio.h>
#include <stdlib.h>

int main()
{
    int malloc_size = 10*sizeof(int);;
    int *ptr;

    // allocate memory
    ptr = (int*) malloc(malloc_size);

    if(ptr == NULL)                     
    {
        printf("Error in malloc");
        exit(0);
    }
    sleep(10);

    // deallocate memory
    free(ptr);

    return 0;
}
