%include "../LIB/pc_iox.inc"

section .data
    N equ 10

    msg_a db "Ingrese valores del vector 1 (0-9): ",0
    msg_b db "Ingrese valores del vector 2 (0-9): ",0

section .bss
    v1 resb N
    v2 resb N

section	.text
	global _start
_start:
                                ;;;;;; a ;;;;;;;
    ;===== vector 1 =====
    mov ecx, N
    mov edx, msg_a
	call puts
    mov edi, v1

    .loop1:
        push ecx
        call getche
        pop ecx
        sub eax, 30h
        mov [edi], al
        inc edi
        mov ebx, eax
        sub ecx, 1h
    jnz .loop1

    mov al,10
	call putchar

    ;===== vector 2 =====
    mov ecx, N
    mov edx, msg_b
	call puts
    mov edi, v2

    .loop2:
        push ecx
        call getche
        pop ecx
        sub eax, 30h
        mov [edi], al
        inc edi
        mov ebx, eax
        sub ecx, 1h
    jnz .loop2

    mov al,10
	call putchar
    

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80