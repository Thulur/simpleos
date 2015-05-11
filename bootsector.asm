[org 0x7c00]
mov ah, 0x0e
mov al, [char1]
int 0x10
mov ah, 0x0e
mov al, [char2]
int 0x10
mov ah, 0x0e
mov al, [char3]
int 0x10

jmp $ 					; Jump to the current line to create an endless loop
						; in order to stop the programming to go to unknown places

char1:
	db 'W'
char2:
	db 'W'
char3:
	db 'E'

times 510-($-$$	) db 0
dw 0xAA55