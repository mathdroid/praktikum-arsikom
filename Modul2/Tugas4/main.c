#include <stdio.h>

int reverseByte(int x){
  return ((x & 0xff) << 24) + (((x >> 8) & 0xff) << 16) + (((x >> 16) & 0xff) << 8) + ((x >> 24) & 0xff);
}

void main(void) {
  int result;
  //example
  result = reverseByte(0x01020304); //result = 0x04030201
  printf("0x%0x\n", result);
}
