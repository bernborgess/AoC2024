#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 1024

int cmp(const void *a, const void *b) { return (*(int *)a - *(int *)b); }

int main() {
  char buf[MAX];
  int idx = 0, size = 100;
  int *l1 = malloc(size * sizeof(int));
  int *l2 = malloc(size * sizeof(int));

  while (fgets(buf, MAX, stdin) != NULL) {
    int x, y;
    sscanf(buf, "%d %d", &x, &y);
    if (idx == size) {
      size *= 2;
      int *temp = realloc(l1, size * sizeof(int));
      if (!temp) exit(1);
      l1 = temp;
      temp = realloc(l2, size * sizeof(int));
      if (!temp) exit(1);
      l2 = temp;
    }
    l1[idx] = x;
    l2[idx] = y;
    idx++;
  }
  // sort
  qsort(l1, size, sizeof(int), cmp);
  qsort(l2, size, sizeof(int), cmp);

  // zip lists, accumulate difference
  int ans = 0;
  for (int i = 0; i < size; i++) {
    ans += abs(l1[i] - l2[i]);
  }

  // print result
  printf("%d\n", ans);

  // tidy
  free(l1);
  free(l2);
}
