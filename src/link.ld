ENTRY(loader)

SECTIONS {
    . = 0x00100000;        /* The code should be loaded at 1 MB (2^20) because smaller addresses are used by GRUB and BIOS */
    .text ALIGN (0x1000) : /* Align at 4KB */
    {
        *(.text)
    }
    .rodata ALIGN (0x1000) :
    {
        *(.rodata*)
    }
    .data ALIGN (0x1000) :
    {
        *(.data)
    }
    .bss ALIGN (0x1000) :
    {
        *(COMMON)
        *(.bss)
    }
}
