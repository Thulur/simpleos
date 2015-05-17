compile bootsector.asm:
	nasm bootsector.asm -f bin -o bootsector.bin

run in qemu:
	qemu-system-x86_64 bootsector.bin
	qemu-system-x86_64 os.bin

compile c code:
	gcc -ffreestanding -c kernel.c -o kernel.o -m32

files to 32-bit binary:
	ld -o kernel.bin -Ttext 0x7e00 kernel.o -m elf_i386 --oformat binary

binary image:
	cat bootsector.bin kernel.bin > os.bin

ensure whole sectors:
	truncate os.bin -s 5120

compile bootsector + kernel and start it:
	nasm bootsector.asm -f bin -o bootsector.bin && gcc -std=gnu99 -ffreestanding -c kernel.c -o kernel.o -m32 && ld -o kernel.bin -Ttext 0x7e00 kernel.o -m elf_i386 --oformat binary && cat bootsector.bin kernel.bin > os.bin && truncate os.bin -s 10240