%include "pc_io.inc"

extern pBin_n   ;nibble menos significativo de AL en formato binario
extern pBin_b   ;valor que tiene AL (byte) en formato binario
extern pBin_w   ;valor que tiene AX (word) en formato binario
extern pBin_dw  ;valor que tiene EAX (double word) en formato binario

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	
    ;===== a =====;
    mov eax, 0x22446688 ; 0010 0010 0100 0100 0110 0110 1000 1000
	ROR eax, 4          ; se recorre 4 a la derecha para 0x82244668
    call pBin_dw

    mov al,10
	call putchar

    ;===== b =====;
    mov cx, 0x3F48  ;
    SHL cx, 3
    mov ax, cx
    call pBin_w
    
    mov al,10
	call putchar

    ;===== c =====;
    mov esi, 0x20D685F3 ;0010 0000 1101 0110 1000 0101 1111 0011
                        ;0100 0000 0000 0100 0010 0000 0010 0001
    xor esi, 0x40042021 ;enmascaramiento para invertir los bits 0, 5, 13, 18 y 30, sin modificar los demás;
    mov eax, esi
    call pBin_dw

    mov al,10
	call putchar

    ;===== d =====;
    PUSH esi
    mov eax, esi
    call pBin_dw

    mov al,10
	call putchar

    ;===== e =====;
    mov ch, 0xA7        ; 1010 0111
    or ch, 0x48         ; 0100 1000, bits 3 y 6
    mov al, ch          ; 1110 1111
    call pBin_b

    mov al,10
	call putchar

    ;===== f =====;
    mov bp, 0x67DA      ; 0110 0111 1101 1010
    xor bp, 0x4452      ; 0100 0100 0101 0010, bits 1, 4, 6, 10, 14
    mov ax, bp          ; 0010 0011 1000 1000
    call pBin_w

    mov al,10
	call putchar

    ;===== g =====;
    SHR bp, 3
    mov ax, bp
    call pBin_w

    mov al,10
	call putchar

    ;===== h =====;
    SHR ebx, 5
    mov eax, ebx
    call pBin_dw

    mov al,10
	call putchar

    ;===== i =====;
    SHL cx, 3
    mov ax, cx
    call pBin_w

    mov al,10
	call putchar

    ;===== j =====;
    POP esi
    mov eax, esi
    call pBin_dw

    mov al,10
	call putchar

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa