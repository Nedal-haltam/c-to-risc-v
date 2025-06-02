volatile char *uart = (char*)0x10000000;

void _start() {
    const char *msg = "Hello from QEMU RISC-V!\n";
    for (const char *p = msg; *p; ++p) {
        *uart = *p; // Write each character to UART
    }

    while (1); // Prevent exit
}
