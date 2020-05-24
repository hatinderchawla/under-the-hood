#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

int main() {
  int i = 0;
  pid_t pid;

  pid = fork();
  if (pid != 0)
  {
    printf("child pid = %u\n", pid);
    printf("From child process\n");
    char * argv_list[] = {"ls","-l",NULL};
    execv("/usr/bin/ls", argv_list); 
  }
  else
  {
    sleep(1);
    printf("Completing parent process\n");
  }
  return 0;
}
