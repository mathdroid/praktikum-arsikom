#include <stdio.h>

int myEncrypt (int x, short encryptor) {
  return (((x >> 24) ^ encryptor) << 24) + ((((x >> 16) & 0xff) ^ encryptor) << 16) + ((((x >> 8) & 0xff) ^ encryptor) << 8) + (((x) & 0xff) ^ encryptor);
}

int myDecrypt (int x, short decryptor) {
  return (((x >> 24) ^ decryptor) << 24) + ((((x >> 16) & 0xff) ^ decryptor) << 16) + ((((x >> 8) & 0xff) ^ decryptor) << 8) + (((x) & 0xff) ^ decryptor);
}

void test(void) {
  int result;
  //example
  result = myEncrypt (123456789, 85); //global_var = 0x00000004 (0b0000...0000000100)
  printf("%d\n", result);

  result = myDecrypt (result, 85); //global_var = 0x00000004 (0b0000...0000000100)
  printf("%d\n", result);
}

void helper(void) {
  printf("Char Byte Size: %d\n", sizeof(char));
  printf("Unsigned Char Byte Size: %d\n", sizeof(unsigned char));
  printf("Signed Char Byte Size: %d\n", sizeof(signed char));
  printf("Short Byte Size: %d\n", sizeof(short));
  printf("Unsigned Short Byte Size: %d\n", sizeof(unsigned short));
  printf("Signed Short Byte Size: %d\n", sizeof(signed short));
  printf("Int Byte Size: %d\n", sizeof(int));
  printf("Unsigned Int Byte Size: %d\n", sizeof(unsigned int));
  printf("Signed Int Byte Size: %d\n", sizeof(signed int));
  printf("Long Byte Size: %d\n", sizeof(long));
  printf("Unsigned Long Byte Size: %d\n", sizeof(unsigned long));
  printf("Signed Long Byte Size: %d\n", sizeof(signed long));
  printf("Long Long Byte Size: %d\n", sizeof(long long));
  printf("Unsigned Long Long Byte Size: %d\n", sizeof(unsigned long long));
  printf("Signed Long Long Byte Size: %d\n", sizeof(signed long long));
  printf("Float Byte Size: %d\n", sizeof(float));
  printf("Double Byte Size: %d\n", sizeof(double));
}

void main(void) {
  test();
}
