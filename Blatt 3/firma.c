#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

#define max(a,b) (a > b ? a : b)
#define min(a,b) (a < b ? a : b)

#include "firma.h"

int main(int argc, char* argv[]) {

   const size_t n = argc;
   int64_t *const data = malloc(sizeof(int64_t) * n);

   for (size_t i = 1; i < n; i++)
      data[i] = (int64_t) strtoimax(argv[i], NULL, 10);

   const int64_t result = gewinn(data, n);

   printf("Das Ergebnis lautet %jd.\n", (intmax_t) result);
}
