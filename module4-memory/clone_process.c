#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <linux/sched.h>

int global1 = 0;

int child_function() {
    int i = 0;
    printf("Child Process: pid = %u, parent pid = %u\n", getpid(), getppid());
    printf("Child Process: stack variable address %10p\n", &i);
    sleep(0.5);
    printf("Child Process: global variable global1 = %d\n", global1);
    sleep(10);
}

int main() {
  int i = 0;
  pid_t pid;
  int child_stack_size = 1024*32;
  int flags = 0;

  printf("pid = %u, parent pid = %u\n", getpid(), getppid());

  void *child_stack = malloc(child_stack_size);

  flags = CLONE_VM;
  pid = clone(child_function, child_stack + child_stack_size, flags, NULL);
  if (pid == -1){
    printf("clone failed\n");
    exit(-1);
  }

  printf("Parent Process: pid = %u, parent pid = %u\n", getpid(), getppid());
  printf("Parent Process: stack variable address %10p\n", &i);
  global1 = 1;
  printf("Parent Process: global variable global1 = %d\n", global1);
  sleep(10);
  return 0;
}
