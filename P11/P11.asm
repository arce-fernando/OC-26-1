section .text
    global str_len
    global str_mid
    global clrBit

;;==================================;;

str_len:    push ebp
            mov ebp, eax
            mov edx, [ebp+8]
            mov eax, 0

.next:      cmp [edx], 0
            je .fin1
            inc eax
            inc edx
            jmp .next

.fin1:      pop ebp
            ret

;;==================================;;

str_mid:

;;==================================;;

clrBit:

;;==================================;;