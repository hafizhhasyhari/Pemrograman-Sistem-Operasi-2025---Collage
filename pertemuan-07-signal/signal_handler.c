## Pertemuan-07-signal/signal_handler.c
# Nama : Hafizh H Asyhari
# Kelas : B
# Negara : Indoesia
# Tahun : 2025

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

void handle_signal(int sig) {
    printf("\nSIGINT (%d) diterima. Program keluar.\n", sig);
    exit(0);
}

int main() {
    signal(SIGINT, handle_signal); // Tangkap CTRL+C

    while (1) {
        printf("Program berjalan... Tekan CTRL+C untuk keluar.\n");
        sleep(1);
    }

    return 0;
}
