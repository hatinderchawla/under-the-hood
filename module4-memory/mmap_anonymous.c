#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <err.h>

int main(int argc, char *argv[])
{
    const int mmap_size = 4096*10;
    char *addr;
    char *dest;
    char hello_world[] = "Hello World from memory mapped anonymous\n";

    addr = (char *) mmap(NULL, mmap_size, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    if (addr == MAP_FAILED)
    {
      err(EXIT_FAILURE,"mmap");
    }

    printf("Memory mapped address %lx\n", addr);
    strcpy(addr, hello_world);
    printf("%s", addr);

    sleep(10);
    munmap(addr, mmap_size);

    exit(EXIT_SUCCESS);
}
