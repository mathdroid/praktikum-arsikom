#include <stdio.h>

int bitMask(int highBit, int lowBit){
  int starting = 0x0;
  if (lowBit > highBit) {
    return 0;
  } else {
    for (int i=31; i>=0; i--) {
      starting = starting << 1;
      if (i <= 5 && i >= 3) {
        starting++;
      }
    }
    return starting;
  }
}

void main(void) {
  int result;
  //example
  result = bitMask(5, 3); //result = 0x38
  printf("0x%0x\n", result);
}
