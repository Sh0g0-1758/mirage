CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c
LD = ld
LDFLAGS = -melf_i386
AS = as
ASFLAGS = --32


build:
	mkdir -p build
	$(CC) $(CFLAGS)  src/kmain.c                    -o build/kmain.o
	$(CC) $(CFLAGS)  src/framebuffer/write.c        -o build/write.o
	$(AS) $(ASFLAGS) src/loader.s                   -o build/loader.o
	$(AS) $(ASFLAGS) src/framebuffer/io.s           -o build/io.o
	$(LD) -T src/link.ld $(LDFLAGS) build/loader.o build/write.o build/io.o build/kmain.o -o build/kernel.elf


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
