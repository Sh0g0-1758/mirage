// Values calculated using gdt_desc.c taken from osdev.wiki
__UINT64_TYPE__ gdt[3] = {0x0000000000000000, 0x00CF9A000000FFFF, 0x00CF92000000FFFF};

struct gdt {
    unsigned short size;
    unsigned int address;
} __attribute__((packed));

struct gdt _gdt;

unsigned int getGdtAddr() {
    _gdt.size = sizeof(gdt) - 1;
    _gdt.address = (unsigned int)gdt;
    return (unsigned int)(&_gdt);
}
