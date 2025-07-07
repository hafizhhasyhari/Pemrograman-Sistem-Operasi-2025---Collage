#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        // Child process
        printf("Ini proses anak. PID: %d\n", getpid());
    } else if (pid > 0) {
        // Parent process
        printf("Ini proses induk. PID: %d, Anak: %d\n", getpid(), pid);
    } else {
        // Error
        perror("Fork gagal");
        return 1;
    }

    return 0;
}
