#define N_LOOP 500
int main(void)
{
  int indeks;
  int accumulator;
  indeks = 0;
  accumulator = 0;
  while(indeks<N_LOOP)
  {
    accumulator = accumulator + indeks;
    indeks = indeks + 1;
  }
  return accumulator;
}
