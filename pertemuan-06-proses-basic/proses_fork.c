## pertemuan-06-proses-basic/proses_fork.c

# Nama : Hafizh H Asyhari
# NIM : 202331206
# Kelas : B
# Undergraduate Student
# Country : Indonesia
# Year : 2025

#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        // Proses anak
        printf("Ini proses anak. PID: %d\n", getpid());
    } else if (pid > 0) {
        // Proses induk
        printf("Ini proses induk. PID: %d, Anak: %d\n", getpid(), pid);
    } else {
        // Gagal fork
        perror("Fork gagal");
        return 1;
    }

    return 0;
}
