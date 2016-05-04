#include <stdio.h>

int bitXor(int x, int y) {
  return ~(x & y) & ~(~x & ~y);
}

void main(void) {
  int result;
  //example
  printf("%d\n", bitXor(4, 5));
}
