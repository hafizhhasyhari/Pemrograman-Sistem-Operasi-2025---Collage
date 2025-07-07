## pertemuan-13-synchronization/sync_mutex.c

# Nama : Hafizh H Asyhari
# Github : https://github.com/hafizhhasyhari
# Semester : 4
# Undergraduate Student
# Country : Indonesia
# Year : 2025

#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t kunci;
int counter = 0;

void* tambah_counter(void* arg) {
    for (int i = 0; i < 5; i++) {
        pthread_mutex_lock(&kunci);
        counter++;
        printf("Thread %ld menambah counter: %d\n", (long)pthread_self(), counter);
        pthread_mutex_unlock(&kunci);
        sleep(1);
    }
    return NULL;
}

int main() {
    pthread_t t1, t2;
    pthread_mutex_init(&kunci, NULL);

    pthread_create(&t1, NULL, tambah_counter, NULL);
    pthread_create(&t2, NULL, tambah_counter, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    pthread_mutex_destroy(&kunci);
    return 0;
}
