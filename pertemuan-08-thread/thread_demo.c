## pertemuan-08-thread/thread_demo.c

#include <stdio.h>
#include <pthread.h>

# Nama : Hafizh H Asyhari
# Kelas : B
# Country : Indonesia
# 2025
  
void* run_thread(void* arg) {
    printf("[THREAD] Pesan: %s\n", (char*)arg);
    return NULL;
}

int main() {
    pthread_t t1;
    pthread_create(&t1, NULL, run_thread, "Halo dari thread 1!");
    pthread_join(t1, NULL);

    printf("[MAIN] Thread selesai.\n");
    return 0;
}
