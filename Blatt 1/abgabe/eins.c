#include<inttypes.h>
#include<stdio.h>

int main(int argc, char* argv[]) {

  const int REQUIRED_AVERAGE = 5;
  puts("Got the following arguments:");
  int sum = 0;
  for (int i = 1; i < argc; ++i) {
    const int val = (int)strtoimax(argv[i], NULL, 10);
    sum += val;
    printf(" - %d\n", val);
  }
  int mean = sum / argc;
  printf("%d\n", mean);
  if (mean >= REQUIRED_AVERAGE) {
	  printf("Ja\n");
  } else {
	  printf("Nein\n");
  }
}
