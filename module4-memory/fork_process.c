#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

int main() {
  int i = 0;
  pid_t pid;

  printf("pid = %u, parent pid = %u\n", getpid(), getppid());
  pid = fork();
  if (pid != 0)
  {
    printf("From parent process\n");
    printf("pid = %u, parent pid = %u\n", getpid(), getppid());
  }
  else
  {
    printf("From child process\n");
    printf("pid = %u, parent pid = %u\n", getpid(), getppid());
  }
  sleep(10);
  return 0;
}
