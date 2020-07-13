#include <stdio.h>
#include <stdlib.h>

int main()
{
    int malloc_size = 1024*32*sizeof(int);;
    int *ptr;

    // allocate memory
    ptr = (int*) malloc(malloc_size);

    if(ptr == NULL)                     
    {
        printf("Error in malloc");
        exit(0);
    }

    int err = mlock(ptr, malloc_size);
    if (err == -1)
    {
        printf("error in mlock");
    }

    sleep(10);

    munlock(ptr, malloc_size);
    // deallocate memory
    free(ptr);

    return 0;
}
