## pertemuan-09-scheduling/fcfs_simulasi.c

#include <stdio.h>

int main() {
    int n, i;
    printf("Masukkan jumlah proses: ");
    scanf("%d", &n);

    int arrival[n], burst[n], start[n], finish[n];

    for (i = 0; i < n; i++) {
        printf("Proses %d - Waktu Datang: ", i+1);
        scanf("%d", &arrival[i]);
        printf("Proses %d - Burst Time: ", i+1);
        scanf("%d", &burst[i]);
    }

    start[0] = arrival[0];
    finish[0] = start[0] + burst[0];

    for (i = 1; i < n; i++) {
        start[i] = (finish[i-1] > arrival[i]) ? finish[i-1] : arrival[i];
        finish[i] = start[i] + burst[i];
    }

    printf("\nFCFS Scheduling:\nProses\tDatang\tMulai\tSelesai\n");
    for (i = 0; i < n; i++) {
        printf("P%d\t%d\t%d\t%d\n", i+1, arrival[i], start[i], finish[i]);
    }

    return 0;
}
