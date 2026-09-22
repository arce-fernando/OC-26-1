%include "pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov al,10B
	call pHex_b	; muestra en pantalla 64;  cambio a 02

	mov al,10	; cambio de linea
	call putchar

	mov ax,0x64Eb 	; presenta en pantalla 12AB;  cambio a 64EB
	call pHex_w

	mov al,10 	; cambio de linea
	call putchar

	mov eax,567h ; presenta en pantalla 1234ABCD;  cambio a 00000567
	call pHex_dw

	mov al,0x0a	  ; cambio de lines 10 decimal o bien 0A hex
	call putchar

	mov eax,0xA67126AB ; presenta en pantalla 76543210;  cambio a A67126AB
        call pHex_dw

	mov al,10       ; cambio de linea
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

