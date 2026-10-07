%include "../LIB/pc_iox.inc"

section .data
	; a
	msg_a_inst1 db "a) Ingrese un caracter (a-z): ",0
	msg_a_menor db 10, "El caracter es menor a 'm'",10,0			;10 para salto de linea
    msg_a_mayor db 10, "El caracter es mayor o igual a 'm'",10,0
	; b
	msg_b_inst2 db "b) Ingrese un caracter (0-9) o (A-Z): ",0
	msg_b_letra db 10, "El caracter es una letra",10,0
	msg_b_numero db 10, "El caracter es un numero",10,0
	; c
	msg_c_inst3 db "c) Triangulo de asteriscos:",10,0
	; d
	msg_d_inst4 db "d) Ingresa 10 caracteres:",10,0
	msg_d_resutlados db 10, "Datos capturados:",10,0

section .bss
	arreglo resb 10			; 10 bytes para el arreglo

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

                                ;;;;;; b ;;;;;;;
    mov edx, msg_b_inst2
	call puts
	
	call getche
	CMP al, '9'
	JB .esnum

	mov edx,msg_b_letra
	call puts
	JMP .fin_b

.esnum:
	mov edx, msg_b_numero
	call puts

.fin_b:
    mov al,10
	call putchar

	                            ;;;;;; c ;;;;;;;
    mov edx, msg_c_inst3
	call puts

	mov cx,6
	CMP cx,0
	JBE .fin_c

	mov ebx,1

.loop_arriba:
	CMP bx, cx
	JG .parte_abajo

	mov edi,1

.loop_arriba2:
	CMP edi,ebx
	JG .sig_ren_arriba
	mov al,'*'
	call putchar
	INC edi
	JMP .loop_arriba2

.sig_ren_arriba:
	mov al,10
	call putchar
	INC ebx
	JMP .loop_arriba

.parte_abajo:
	mov ebx,ecx
	DEC ebx

.loop_abajo:
	cmp ebx,1
	JL .fin_c

	mov edi,1

.loop_abajo2:
	CMP edi,ebx
	JG .sig_ren_abajo
	mov al,'*'
	call putchar
	INC edi
	JMP .loop_abajo2

.sig_ren_abajo:
	mov al,10
	call putchar
	DEC ebx
	JMP .loop_abajo
	
.fin_c:
    mov al,10
	call putchar

	                            ;;;;;; d ;;;;;;;
    mov edx, msg_d_inst4
	call puts
	
	mov ecx,10
	mov esi,arreglo

.loop_captura:
	call getche
	mov [esi],al
	INC esi
	loop .loop_captura

	mov edx,msg_d_resutlados
	call puts

	mov ecx,10
	mov esi,arreglo

.loop_mostrar:
	mov al,[esi]
	call putchar
	mov al,10
	call putchar
	INC esi
	loop .loop_mostrar

    mov al,10
	call putchar

                                ;;;;;; fin ;;;;;;;
	mov eax, 1
	int 0x80