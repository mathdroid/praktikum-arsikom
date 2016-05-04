int square (int x)
{
  return x*x;
}
int squaresum (int y, int z)
{
  int temp1 = square(y);
  int temp2 = square(z);
  return temp1+temp2;
}
int main (void)
{
  int a = 5;
  int b = 9;
  return squaresum(a,b);
}
