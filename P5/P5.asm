%include "pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    mov ebx,0x5C4B2A60 
    ADD ebx,0x2218597;  matricula = 2218597
    mov eax, ebx
    call pHex_dw



    mov al,10
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel