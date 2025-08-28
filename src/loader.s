    .globl loader                                # entry symbol for ELF

    .set MAGIC_NUMBER      , 0x1BADB002
    .set FLAGS             , 0x0
    .set CHECKSUM          , -(MAGIC_NUMBER + FLAGS)
    .set KERNEL_STACK_SIZE , 0x1000              # 4096 bytes

    .section .bss
    .align 4
kernel_stack:
    .skip KERNEL_STACK_SIZE

    .section .text
    .align 4
    .long MAGIC_NUMBER
    .long FLAGS
    .long CHECKSUM

loader:
    movl $0xCAFEBABE, %eax                       # place 0xCAFEBABE into %eax
    movl $kernel_stack + KERNEL_STACK_SIZE, %esp # set esp to the base of stack
    .extern load_gdt
    call load_gdt
    .extern kmain
    call kmain
loop:
    jmp loop                                     # infinite loop
