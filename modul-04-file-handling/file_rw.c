#include <stdio.h>

int main() {
    FILE *fp;

    // Menulis ke file
    fp = fopen("data.txt", "w");
    if (fp == NULL) {
        perror("Gagal membuka file");
        return 1;
    }
    fprintf(fp, "Halo, ini file handling di C!\n");
    fclose(fp);

    // Membaca file
    char buffer[100];
    fp = fopen("data.txt", "r");
    if (fp == NULL) {
        perror("File tidak ditemukan");
        return 1;
    }

    while (fgets(buffer, 100, fp)) {
        printf("%s", buffer);
    }

    fclose(fp);
    return 0;
}
