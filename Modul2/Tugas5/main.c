#include <stdio.h>

int minBytes (int x, int y) {
    return (x + ~y + 1);
}

void main(void) {
  int result;
  //example
  result = minBytes (0x15, 0x07); //result = 0x0E
  printf("0x%0x\n", result);
}
