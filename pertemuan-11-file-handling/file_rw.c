#include <stdio.h>
# pertemuan-11-file-handling/file_rw.c - by Hafizh Hilman Asyhari @hafizhhasyhari
int main() {
    FILE *fp = fopen("output.txt", "w");
    if (fp == NULL) {
        perror("Gagal membuka file");
        return 1;
    }

    fprintf(fp, "Halo dari program C!\n");
    fclose(fp);

    char buffer[100];
    fp = fopen("output.txt", "r");
    if (fp == NULL) {
        perror("File tidak ditemukan");
        return 1;
    }

    while (fgets(buffer, sizeof(buffer), fp)) {
        printf("%s", buffer);
    }

    fclose(fp);
    return 0;
}
