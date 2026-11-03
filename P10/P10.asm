section .text
    global pBin8b
    global pBin16b
    global pBin32b
    global pBin64b
    
;;==================================;;

my_putchar: pushad
            push eax
            mov eax, 4
            mov ebx, 1
            mov ecx, esp
            mov edx, 1
            int 80h
            pop eax
            popad
            ret

;;==================================;;

pBin8b: 

pBin16b: 

pBin32b: 

pBin64b: 
