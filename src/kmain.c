int fb_write(char *buf, unsigned int len);
int serial_write(char *buf, unsigned int len);
unsigned char serial_read();
void serial_init();

int kmain() {
    fb_write("MIRAGE", 6);
    fb_write("      ", 6);
    fb_write("MIRAGE", 6);
    serial_init();
    serial_write("BYE-BYE", 7);
    return 3735928559;
}
