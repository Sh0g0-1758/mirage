#include "framebuffer/framebuffer.h"
#include "io/io.h"

int kmain() {
    char* os_name = "MIRAGE";
    for(int i = 0; i < 6; i++) {
        fb_write_cell(i * 2, os_name[i], RED, BLACK);
    }
    fb_move_cursor(6);
    return 3735928559; // 0xDEADBEEF
}
