CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c
LD = ld
LDFLAGS = -melf_i386
AS = as
ASFLAGS = --32


build:
	mkdir -p build
	$(CC) $(CFLAGS)  src/kmain.c                    -o build/kmain.o
	$(CC) $(CFLAGS)  src/framebuffer/framebuffer.c  -o build/framebuffer.o
	$(CC) $(CFLAGS)  src/io/io.c                    -o build/io.o
	$(AS) $(ASFLAGS) src/loader.s                   -o build/loader.o
	$(AS) $(ASFLAGS) src/io/io.s                    -o build/io_asm.o
	$(LD) -T src/link.ld $(LDFLAGS) build/loader.o build/framebuffer.o build/io_asm.o build/io.o build/kmain.o -o build/kernel.elf


image: build
	cp build/kernel.elf iso/boot/
	mkdir -p image
	grub-mkrescue -o image/os.iso iso


emulate: image
	bochs -f emulator/bochsrc.txt


clean:
	rm -rf build
	rm -rf image
	rm iso/boot/kernel.elf
	rm bochslog.txt


.PHONY: build clean image emulate
