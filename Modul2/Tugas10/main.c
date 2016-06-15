#include <stdio.h>

// reads at most 100 chars. Have a sentinel '.'.

typedef int bool;
#define true 1
#define false 0

char capture[100][100];
char usrIn;
int idx = 0;
bool reading = true;

void test(void) {
  while (reading) {
    if (idx > 99) {
      reading = false;
    } else {
      scanf(" %c", &usrIn);
      if (usrIn != '.') {
        capture[idx][0] = usrIn;
        idx++;
      } else {
        reading = false;
      }
    }
  }
  for (int i = 0; i<100; i++) {
    printf("%s\n", capture[i]);
  }
  printf("\n");
}


void main(void) {
  printf("Reads string from stdin and returns the reverse. Max 100 chars. End input with dot character '.'.\n");
  test();
}
