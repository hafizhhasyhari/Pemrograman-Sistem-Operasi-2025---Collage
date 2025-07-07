#include <stdio.h>
#include <stdlib.h>

## pertemuan-10-memori/malloc_free.c - by Hafizh H Asyhari @hafizhhasyhari
int main() {
    int *array;
    int n;

    printf("Masukkan jumlah elemen: ");
    scanf("%d", &n);

    array = (int*) malloc(n * sizeof(int));
    if (array == NULL) {
        printf("Gagal mengalokasikan memori.\n");
        return 1;
    }

    for (int i = 0; i < n; i++) {
        array[i] = i * 2;
        printf("array[%d] = %d\n", i, array[i]);
    }

    free(array);
    return 0;
}
