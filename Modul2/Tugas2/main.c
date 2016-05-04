#include <stdio.h>

int getByte(int x, int y) {
  return (x >> (8 * y)) & 0xff;
}

void main(void) {
  int result;
  //example
  result = getByte(0x12345678, 1); //result = 0x56
  printf("0x%0x\n", result);
}
