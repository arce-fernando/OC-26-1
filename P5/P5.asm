%include "pc_iox.inc"

section .data
    N dw 0   ;dw para 2 bytes en N

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point


                               ;;;;;; 2.a ;;;;;;;
    mov ebx,0x5C4B2A60 
    ADD ebx,0x2218597;  matricula = 2218597
    mov eax, ebx
    call pHex_dw
    
    mov al,10
	call putchar
                               ;;;;;; 2.b ;;;;;;;
    push bx;
    mov ax, bx;       se mueve bx al acumulador
    call pHex_w
    
    mov al,10
	call putchar

                               ;;;;;; 2.c ;;;;;;;
    mov al, bl
    mov cl, 8
    mul cl;         cl x al
    mov [N],ax
    call pHex_w

    mov al,10
	call putchar

                               ;;;;;; 2.d ;;;;;;;
    INC word[N]
    mov ax, [N]
    call pHex_w

    mov al,10
	call putchar

                               ;;;;;; 2.e ;;;;;;;
    mov al,10
	call putchar

    mov ax, bx
    mov cl, 0xFF
    DIV cl;             al=cociente     ah=residuo

    mov bl, ah;     se guarda temporalmente ah en bl
    mov ah, 0;      ah=0 para dejar el cociente sin residuos
    call pHex_w

    mov al,10
	call putchar

    mov al, bl;     regresa el residuo y se carga en al
    mov ah, 0
    call pHex_w

    mov al,10
	call putchar

    mov al,10
	call putchar

                               ;;;;;; 2.f ;;;;;;;
    ;considerando que 'ax' ya tiene el residuo
    ADD ax, [N]
    call pHex_w

    mov al,10
	call putchar

                               ;;;;;; Fin ;;;;;;;

    mov al,10
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel