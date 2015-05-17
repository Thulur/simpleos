[bits 16]

%include "asm/gdt.asm"

protected_mode:
	cli								; Switch off interrupts

	lgdt [gdt_descriptor]

	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	
	jmp code:pm_init

[bits 32]

pm_init:
	mov ax, data
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call pm_enter

[bits 16]