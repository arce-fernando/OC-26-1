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
    ;===== Vector 1 =====
    mov edx, msg_a
    call puts
    mov ecx, N
    mov ebx, v1
    call captura_v

    mov al, 10
    call putchar

    ;===== Vector 2 =====
    mov edx, msg_b
    call puts
    mov ecx, N
    mov ebx, v2
    call captura_v

    mov al, 10
    call putchar

                                ;;;;;; b ;;;;;;;
    ;===== Mostrar v1 =====
    call mostrar_v

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80

                            ;;;;;; procedimientos ;;;;;;
    ;===== Captura vector =====
captura_v:
    push ecx
    push ebx

    .loop:
        push ecx
        call getche
        pop ecx

        sub eax, 30h
        mov [ebx], al
        inc ebx
        sub ecx, 1h
        jnz .loop
    
    pop ebx
    pop ecx
    ret

    mov al,10
	call putchar


        ;===== Mostrar vector =====
mostrar_v:
    push ecx
    push ebx

    .loop2:
        mov al, [ebx]
        add al, 30h

        push ecx
        call putchar
        pop ecx
    
        inc ebx
        sub ecx, 1h        
        jnz .loop2
    
    pop ebx
    pop ecx
    ret

    mov al,10
	call putchar