#include <stdio.h>

int main(void) {
    char num[] = "5447175926";
    int sum = 0;
    for (int i = 0; num[i]; i++)
        sum += num[i] - '0';
    printf("%d\n", sum);
    return 0;
}