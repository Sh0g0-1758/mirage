#include "framebuffer.h"

static unsigned fb_pos = 0;

int fb_write(char *buf, unsigned int len) {
    for(unsigned int i = 0; i < len; i++) {
        fb_write_cell(fb_pos, buf[i], RED, BLUE);
        fb_pos += 2;
    }
    fb_move_cursor((unsigned short)(fb_pos / 2));
    return 0;
}
