#include <stdio.h>
#include <stdlib.h> 

void obratn (int N, int* a, int* res) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (a[j] == i + 1) {
                res[i] = j;
                break;
            }
        }
    }
    return;
}

int main()
{
    int N; // длина перестановок
    printf ("Введите длину перестановки:");
    scanf ("%d", &N);
    int* a = (int*)malloc(N * sizeof(int));
    int* res = (int*)malloc(N * sizeof(int));
    printf ("Введите перестановку: ");
    for (int i = 0; i < N; i++) {
        int ai;
        scanf ("%d", &ai);
        a[i] = ai;
    }
    obratn (N, a, res);
    printf ("\nОбратная перестановка: ");
    for (int i = 0; i < N; i++) {
        int resi;
        resi = res[i] + 1;
        printf ("%d ", resi);
    }
    return 0;
}
    
    