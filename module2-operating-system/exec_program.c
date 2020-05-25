#include <stdio.h>
#include <sys/types.h>

int main() {
  char * argv_list[] = {"date", NULL, NULL};
  execv("/usr/bin/date", argv_list); 
  printf("Please print me");
  return 0;
}
