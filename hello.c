#include <stdio.h>

void hello(void) {
    printf("Hello, World!\n");
}

void world(int a) {
    printf("Hello, World! %d\n", a);
}

int main() {
    hello();
    world();

    return 0;
}
