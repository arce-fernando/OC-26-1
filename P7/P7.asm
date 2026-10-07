%include "../LIB/pc_iox.inc"

section .data
	; a
	msg_a_inst1 db "a) Ingrese un caracter (a-z): ",0
	msg_a_menor db 10, "El caracter es menor a 'm'",10,0			;10 para salto de linea
    msg_a_mayor db 10, "El caracter es mayor o igual a 'm'",10,0

section	.text
	global _start
_start:
                                ;;;;;; a ;;;;;;;
    mov edx, msg_a_inst1
	call puts
	
	call getche
	CMP al, 'm'
	JB .esmenor

	mov edx,msg_a_mayor
	call puts
	JMP .fin_a

.esmenor:
	mov edx, msg_a_menor
	call puts

.fin_a:
    mov al,10
	call putchar

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80