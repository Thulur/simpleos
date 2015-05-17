read_from_disk:
	mov ah, 0x02

	mov ch, 0
	mov dh, 0
	mov cl, 2

	mov bx, 0
	mov es, bx
	mov bx, 0x7c00 + 512 			; Sector after the bootsector

	int 0x13

	jc read_error					; Displays error message, if the sector could not be read 
									; (Carry Flag set by BIOS)

	ret	

read_error:
	;mov si, MSG_SEC_READ_ERROR
	;call print_str
	jmp $
MSG_SEC_READ_ERROR:
	db 'Disk could not be read!', 