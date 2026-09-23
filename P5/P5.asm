%include "pc_iox.inc"

section .data
    N dw 0   ;dw para 2 bytes en N

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point


                               ;;;;;; 2.a ;;;;;;;
    mov ebx,0x5C4B2A60 
    ADD ebx,0x02218597;  matricula = 2218597
    mov eax, ebx
    call pHex_dw
    
    mov al,10
	call putchar
                               ;;;;;; 2.b ;;;;;;;
    push ebx;
    mov eax, ebx;       se mueve bx al acumulador
    call pHex_dw
    
    mov al,10
	call putchar

                               ;;;;;; 2.c ;;;;;;;
    mov eax, 0
    mov al, bl
    mov ecx, 8
    mul ecx;         cl x al
    mov [N],ax
    call pHex_dw

    mov al,10
	call putchar

                               ;;;;;; 2.d ;;;;;;;
    INC word[N]
    mov eax,0
    mov ax, [N]
    call pHex_dw

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
    call pHex_dw

    mov al,10
	call putchar

    mov al, bl;     regresa el residuo y se carga en al
    mov ah, 0
    call pHex_dw

    mov al,10
	call putchar

    mov al,10
	call putchar

                               ;;;;;; 2.f ;;;;;;;
    pop ax;         se recupera el residuo
    ADD ax, [N]
    call pHex_dw

    mov al,10
	call putchar

                                ;;;;;; 2.g ;;;;;;;
    mov [N],ax
    DEC word[N]

    PUSHF
    POP ax
    call pHex_dw;        se obtiene '0286'

    ;   0x0206 = 0000 0010 1000 0110 = bits activados -> 1, 2, 7 y 9
    ;   Al convertir en binario 0x0286, las banderas activas de acuerdo con el registro
    ;   'EFLAGS' son Paridad (P, bit 2), Signo (S, bit 7) y Habilitar Interrupciones (I, bit 9),
    ;   mientas que el bit 1 es un bit reservado sin función de bandera.

    mov al,10
	call putchar

                                ;;;;;; 2.h ;;;;;;;
    POP ax
    call pHex_dw

                               ;;;;;; Fin ;;;;;;;

    mov al,10
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel