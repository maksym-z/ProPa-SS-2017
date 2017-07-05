#include<inttypes.h>
#include<stdio.h>

int main(int argc, char* argv[]) {
  puts("Got the following arguments:");
  for (int i = 1; i < argc; ++i) {
    const int val = (int)strtoimax(argv[i], NULL, 10);
    printf(" - %d\n", val);
  }
}