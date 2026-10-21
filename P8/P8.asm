%include "../LIB/pc_iox.inc"

section .data
    N equ 10

    msg_1 db 10,"Ingrese valores del vector 1 (0-9): ",0
    msg_2 db "Ingrese valores del vector 2 (0-9): ",0
    msg_3 db 10,"Valores del vector 1: ",0
    msg_4 db 10,"Valores del vector 2: ",0
    msg_5 db 10,"Sumatoria de vector 1 y vector 2: ",0
    msg_6 db 10,"Producto escalar de vector 1 y vector 2: ",0

section .bss
    v1 resb N
    v2 resb N

section	.text
	global _start
_start:
                                ;;;;;; a ;;;;;;;
    ;===== Vector 1 =====
    mov edx, msg_1
    call puts
    mov ecx, N
    mov ebx, v1
    call captura_v

    mov al, 10
    call putchar

    ;===== Vector 2 =====
    mov edx, msg_2
    call puts
    mov ecx, N
    mov ebx, v2
    call captura_v

    mov al, 10
    call putchar

                                ;;;;;; b ;;;;;;;
    ;===== Mostrar v1 =====
    mov edx, msg_3
    call puts

    mov ecx, N
    mov ebx, v1
    call mostrar_v

    ;===== Mostrar v2 =====
    mov edx, msg_4
    call puts

    mov ecx, N
    mov ebx, v2
    call mostrar_v

    mov al, 10
    call putchar

                                ;;;;;; c ;;;;;;;
    mov edx, msg_5
    call puts
    mov ebx, v1
    mov edx, v2
    mov ecx, N
    call suma_v

    mov ebx, v1
    mov ecx, N
    call mostrar_v

    mov al, 10
    call putchar

                                ;;;;;; d ;;;;;;;
    mov edx, msg_6
    call puts

    mov ebx, v1
    mov edx, v2
    mov ecx, N
    call prodct_esc
    call pHex_n

    mov al, 10
    call putchar

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
        call pHex_n
        pop ecx
    
        inc ebx
        sub ecx, 1h        
        jnz .loop2
    
    pop ebx
    pop ecx
    ret

    mov al,10
	call putchar


;===== Sumar vectores =====
suma_v:
    push ecx
    push ebx
    push edx

    .loopsum:
        mov al, [ebx]
        add al, [edx]
        mov [ebx], al

        inc ebx
        inc edx
        sub ecx, 1h
        jnz .loopsum
    
    pop edx
    pop ebx
    pop ecx
    ret


;===== Producto escalar =====
prodct_esc:
    push ecx
    push ebx
    push edx

    xor eax, eax

    .loop_prodct:
        mov al, [ebx]
        mov dl, [edx]

        mul dl      ; al * dl

        push edx
        movzx edx, ax
        add eax, edx
        pop edx

        inc ebx
        inc edx
        sub ecx, 1h
        jnz .loop_prodct

        pop edx
        pop ebx
        pop ecx
        ret