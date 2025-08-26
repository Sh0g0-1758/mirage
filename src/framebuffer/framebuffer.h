#ifndef INCLUDE_FRAMEBUFFER_H
#define INCLUDE_FRAMEBUFFER_H

#define BLACK   0
#define BLUE    1
#define GREEN   2
#define CYAN    3
#define RED     4
#define MAGENTA 5
#define BROWN   6

void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg);

#endif /* INCLUDE_FRAMEBUFFER_H */