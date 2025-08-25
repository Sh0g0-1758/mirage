CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c
LD = ld
LDFLAGS = -melf_i386
AS = as
ASFLAGS = --32


build:
	mkdir -p build
	$(CC) $(CFLAGS)  src/kmain.c  -o build/kmain.o
	$(AS) $(ASFLAGS) src/loader.s -o build/loader.o
	$(LD) -T src/link.ld $(LDFLAGS) build/loader.o build/kmain.o -o build/kernel.elf


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
