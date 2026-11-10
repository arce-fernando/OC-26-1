section .text
    global str_len
    global str_mid
    global clrBit

;;==================================;;

str_len:    push ebp
            mov ebp, eax
            
.next:      mov edx, [ebp+8]
            mov eax, 0
            cmp [edx], 0
            je fin
            inc eax
            jmp .next

            pop ebp
            ret

;;==================================;;

str_mid:

;;==================================;;

clrBit:

;;==================================;;