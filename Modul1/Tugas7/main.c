#include <stdio.h>
#include "add.h"

int x, y;
int res;
void main(void) {
  printf("first number:\n");
  scanf("%d", &x);
  printf("second number:\n");
  scanf("%d", &y);
  res = sum(x, y);
  printf("%d\n", accum);
}
