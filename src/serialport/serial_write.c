#include "serialport.h"

void serial_init() {
    serial_configure_baud_rate(SERIAL_COM1_BASE, 2);
    serial_configure_line(SERIAL_COM1_BASE);
    serial_configure_buffer(SERIAL_COM1_BASE);
    serial_configure_modem(SERIAL_COM1_BASE);
}

int serial_write(char *buf, unsigned int len) {
    for(unsigned int i = 0; i < len; i++) {
        outb(SERIAL_DATA_PORT(SERIAL_COM1_BASE), buf[i]);
    }
    return 0;
}
