%include "pc_iox.inc"

section	.text
	global _start
_start:
                                ;;;;;; a ;;;;;;;
    mov

    mov al,10
	call putchar

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80