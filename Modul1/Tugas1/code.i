# 1 "code.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "code.c"

int main(void)
{
  int indeks;
  int accumulator;
  indeks = 0;
  accumulator = 0;
  while(indeks<500)
  {
    accumulator = accumulator + indeks;
    indeks = indeks + 1;
  }
  return accumulator;
}
