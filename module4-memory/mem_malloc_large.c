#include <stdio.h>
#include <stdlib.h>

int main()
{
    // This will do a 128KB malloc (1024*32*4 bytes per int) which will happen with mmap with a new region
    int large_malloc_size = 1024*33*sizeof(int);
    int small_malloc_size = 10*sizeof(int);

    int i = 0;

    int *ptr_small;
    int *ptr_large;

    ptr_small = (int*) malloc(small_malloc_size);
    *ptr_small = 1;

    if(ptr_small == NULL)                     
    {
        printf("Error in malloc");
        exit(0);
    }

    // allocate memory
    ptr_large = (int*) malloc(large_malloc_size);
 
    if(ptr_large == NULL)                     
    {
        printf("Error in malloc");
        exit(0);
    }

    printf("Heap address small malloc %lx\n",ptr_small );
    printf("Heap address large malloc %lx\n",ptr_large );

    sleep(10);

     // deallocate memory
    free(ptr_small);
    free(ptr_large);

    return 0;
}
