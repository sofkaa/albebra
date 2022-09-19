#include <stdio.h>
#include <stdlib.h> 

int main()
{
    int N; // длина перестановок
    printf ("Введите длину перестановки:");
    scanf ("%d", &N);
    int* a = (int*)malloc(N * sizeof(int));
    int* b = (int*)malloc(N * sizeof(int));
    int* c = (int*)malloc(N * sizeof(int)); // результат умножения
    printf ("Введите перестановку A: ");
    for (int i = 0; i < N; i++) {
        int ai;
        scanf ("%d", &ai);
        a[i] = ai;
    }
    printf ("Введите перестановку В: ");
    for (int i = 0; i < N; i++) {
        int bi;
        scanf ("%d", &bi);
        b[i] = bi;
    }
    for (int i = 0; i < N; i++) {
        c[i] = b[a[i] - 1];
    }
    printf ("А х В: ");
    for (int i = 0; i < N; i++) {
        int ci;
        ci = c[i];
        printf ("%d ", ci);
    }
    return 0;
}

