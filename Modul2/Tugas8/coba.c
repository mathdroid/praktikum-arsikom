void coba(int* x, int* y, int* z) {
  int a, b, c, d;

  a = *x;
  b = *y;
  c = *z;
  d = a+b;
  *y = d;
  *z = b;
  *x = c;

}
