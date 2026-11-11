section .text
    global str_len
    global str_mid
    global clrBit

;;==================================;;

str_len:    push ebp
            mov ebp, esp
            mov edx, [ebp+8]
            mov eax, 0

.next:      cmp byte[edx], 0
            je .fin1
            inc eax
            inc edx
            jmp .next

.fin1:      pop ebp
            ret

;;==================================;;

str_mid:    push ebp
            mov ebp, esp
            push ebx

            mov edx, [ebp+8]
            mov ebx, [ebp+12]
            mov ecx, [ebp+16]
            mov eax, [ebp+20]
            
.fin2:      pop ebx
            pop ebp
            ret

;;==================================;;

clrBit:

;;==================================;;