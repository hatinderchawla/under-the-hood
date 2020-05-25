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
    char * argv_list[] = {"date", NULL, NULL};
    execv("/usr/bin/date", argv_list); 
  }
  else
  {
    sleep(1);
    printf("From child process\n");
    printf("pid = %u, parent pid = %u\n", getpid(), getppid());
    printf("Done\n");
  }
  return 0;
}
