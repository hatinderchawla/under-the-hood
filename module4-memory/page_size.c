#include <stdio.h>
#include <unistd.h>

int main() {
  int page_size;
  page_size = sysconf(_SC_PAGE_SIZE);
  printf("Page Size = %d\n", page_size);
  return 0;
}
