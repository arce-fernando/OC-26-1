%include "pc_io.inc"

extern pBin_n   ;nibble menos significativo de AL en formato binario
extern pBin_b   ;valor que tiene AL (byte) en formato binario
extern pBin_w   ;valor que tiene AX (word) en formato binario
extern pBin_dw  ;valor que tiene EAX (double word) en formato binario

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	
    ;===== a =====;
    mov eax, 0x22446688
	ROR eax, 1
    call pBin_b

    mov al,10
	call putchar

    ;===== b =====;
    mov cx, 0x3F48
    SHR cx, 1       ; 3F48 = 0-> 3F4 ->8 = 03F4
    SHL cx, 2       ; 03F4 = 0 3 <- F4 <- 0 0 = F400

    ;FA40 ?

    mov al,10
	call putchar

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa