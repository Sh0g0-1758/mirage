.globl load_gdt

load_gdt:
    .extern getGdtAddr
    call getGdtAddr
    lgdtl (%eax)
    movw $0x10, %ax
    movw %ax, %ds
    movw %ax, %ss
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %gs
    ljmp $0x08, $flush_cs
flush_cs:
    ret
