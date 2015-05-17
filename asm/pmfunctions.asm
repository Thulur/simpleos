[bits 32]

video_memory equ 0xb8000
white_on_black equ 0x0f

pm_print_str:
	pusha
	mov edx, video_memory

	pm_print_str_loop:
		mov al, [esi]
		mov ah, white_on_black

		cmp al, 0
		je pm_print_str_loop_end

		mov [edx], ax
		add esi, 1
		add edx, 2

		jmp pm_print_str_loop
	pm_print_str_loop_end:

	popa
	ret

[bits 16]