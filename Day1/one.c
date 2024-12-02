#include <stdio.h>
// #include <stdlib.h>
#include <string.h>
#define MAX 1024

int* get_list() {
  char buf[MAX];
  fgets(buf, MAX, stdin);
  // counts elements
  int len = strlen(buf);
  int gaps = 0, was = 1;
  for (int i = 0; i < len; i++) {
    if (buf[i] != ' ') {
      was = 1;
      continue;
    }
    if (was) {
      gaps++;
      was = 0;
    }
  }

  // List with as many ints as there are gaps

  // read int for each gap
  for (int i = 0; i < gaps; i++) {
  }
}

int main() {
  // read list 1
  int* list1 = get_list();

  // read list 2
  // sort list 1
  // sort list 2
  // zip lists, accumulate difference
  // print result
}
