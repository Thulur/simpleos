[org 0x7c00]

mov bp, 0xffff
mov sp, bp

mov al, 19							; Load 19 more sectors behind 0x7c00
mov bx, kernel_entry
call read_from_disk

call protected_mode

jmp $ 								; Jump to the current line to create an endless loop
									; in order to stop the programming to go to unknown places

[bits 32]

pm_enter:
	mov esi, MSG_PM
	call pm_print_str

	jmp kernel_entry

[bits 16]

%include "asm/functions.asm"
%include "asm/pmfunctions.asm"
%include "asm/protectedmode.asm"

MSG_PM:
	db '32-bit protected mode', 0

times 510-($-$$	) db 0
dw 0xAA55

kernel_entry: