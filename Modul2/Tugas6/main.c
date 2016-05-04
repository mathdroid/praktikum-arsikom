#include <stdio.h>

int global_var = 0;

int shiftRegister (int x) {
    global_var = (global_var << 5) + x;
    return global_var;
}

void test(void) {
  global_var = 0;
  //example
  shiftRegister (0x04); //global_var = 0x00000004 (0b0000...0000000100)
  printf("0x%0x\n", global_var);
  shiftRegister (0x13); //global_var = 0x00000093 (0b0000...0010010011)
  printf("0x%0x\n", global_var);
}

void main(void) {
  test();
}
