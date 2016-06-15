#include <stdio.h>

void test(void) {
  int inMass = 0;
  scanf("%d", &inMass);
  printf("%d Pounds\n", inMass/16);
  printf("%d Ounces\n", inMass % 16);
}


void main(void) {
  printf("Masukkan massa dalam ounces: ");
  test();
}
