#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <err.h>

int main(int argc, char *argv[])
{
    char *addr;
    char *dest;
    char hello_world[] = "Hello World from memory mapped file\n";
    int fd;

    fd = open("./test.read", O_RDWR|O_CREAT|O_TRUNC);
    if (fd == -1)
      err(EXIT_FAILURE, "open");

    write(fd, hello_world, strlen(hello_world));
    close(fd);

    fd = open("./test.read", O_RDONLY);

    if (fd == -1)
      err(EXIT_FAILURE, "open");

    addr = (char *) mmap(NULL, 4096, PROT_READ, MAP_PRIVATE, fd, 0);
    if (addr == MAP_FAILED)
      err(EXIT_FAILURE,"mmap");

    close(fd);

    printf("Memory mapped address %lx\n", addr);
    printf("%s", addr);
    munmap(addr, 4096);

    exit(EXIT_SUCCESS);
}
