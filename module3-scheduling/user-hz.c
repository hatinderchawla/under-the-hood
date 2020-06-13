#include <stdio.h>
#include <unistd.h>

int main() {
  int USER_HZ;
  USER_HZ = sysconf(_SC_CLK_TCK);
  printf("USER_HZ = %d\n", USER_HZ);
  return 0;
}
