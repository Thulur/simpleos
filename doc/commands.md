compile bootsector.asm:
	nasm bootsector.asm -f bin -o bootsector.bin

run in qemu:
	qemu-system-x86_64 bootsector.bin
