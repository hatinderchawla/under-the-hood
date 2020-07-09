#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    char *addr;
    char hello_world[] = "Hello World from memory mapped file\n";
    int fd;
    // add 1 to length for string NULL terminator \0
    int len = strlen(hello_world) + 1;

    fd = open("./test.write", O_RDWR|O_CREAT,S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
    if (fd == -1)
      err(EXIT_FAILURE, "open");

    if (ftruncate(fd, len) == -1)
      err(EXIT_FAILURE, "ftruncate");
 
    addr = (char *) mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    if (addr == MAP_FAILED)
      err(EXIT_FAILURE, "mmap");

    close(fd);

    printf("Memory mapped address %lx\n", addr);
    strcpy(addr, hello_world);
    printf("%s", addr);

    munmap(addr, len);

    exit(EXIT_SUCCESS);
}
