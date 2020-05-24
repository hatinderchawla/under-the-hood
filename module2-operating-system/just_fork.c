#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

int main() {
  int i = 0;
  pid_t pid;

  pid = fork();
  int self_pid = getpid();
  int parent_pid = getppid();
  printf("Completing process. self pid = %u, parent pid = %u\n", self_pid, parent_pid);
  return 0;
}
