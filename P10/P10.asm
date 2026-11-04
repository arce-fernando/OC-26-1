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

pBin8b: push ebp
        mov ebp, esp

        mov eax, [esp+8]
        mov ecx, 8

        .loop1:
               shl al, 1
               push eax
               push ecx
               mov al, '0'
               jnc .print1
               mov al, '1'
        
        .print1:
               call my_putchar
               pop ecx
               pop eax
               loop .loop1
        
        pop ebp
        ret

pBin16b: push ebp
         mov ebp, esp

         mov eax, [esp+8]
         mov ecx, 16    ; iteraciones

         .loop2:
                shl ax, 1
                push eax
                push ecx
                mov ax, '0'
                jnc .print2
                mov ax, '1'
        
        .print2:
               call my_putchar
               pop ecx
               pop eax
               loop .loop2
        
        pop ebp
        ret

pBin32b: 

pBin64b: 
