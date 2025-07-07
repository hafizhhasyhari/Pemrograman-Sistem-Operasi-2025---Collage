## pertemuan-14-pipes-sharedmem/pipe_sharedmem.c

# Nama : Hafizh H Asyhari
# NIM : 202331206
# Undergraduate Student
# Indonesia
# 2025

#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main() {
    int fd[2];
    pid_t pid;
    char pesan[] = "Halo dari proses induk!";
    char buffer[100];

    pipe(fd);
    pid = fork();

    if (pid == 0) {
        // Proses anak
        close(fd[1]); // tutup tulis
        read(fd[0], buffer, sizeof(buffer));
        printf("Anak membaca: %s\n", buffer);
    } else {
        // Proses induk
        close(fd[0]); // tutup baca
        write(fd[1], pesan, strlen(pesan)+1);
    }

    return 0;
}
