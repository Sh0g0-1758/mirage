build:
	mkdir -p build
	nasm -f elf32 src/loader.s -o build/loader.o
	ld -T src/link.ld -melf_i386 build/loader.o -o build/kernel.elf


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
