#include <stdio.h>
#include <sys/types.h>

int main() {
  char * argv_list[] = {"ls","-l",NULL};
  execv("/usr/bin/ls", argv_list); 
  return 0;
}
