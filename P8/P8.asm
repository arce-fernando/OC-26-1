%include "../LIB/pc_iox.inc"

section .data
    N db 3

    msg_a db "Ingrese valores de  0 a 9: ",0

section	.text
	global _start
_start:
                                ;;;;;; a ;;;;;;;

    mov ecx, N



    mov edx, msg_a
	call puts

    .loop1:
        call getche
        mov ebx, eax
        call pHex_b
        dec ecx, 1
    jmp .loop1

    mov al,10
	call putchar

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80