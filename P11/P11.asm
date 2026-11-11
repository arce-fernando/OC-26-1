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

            mov edx, [ebp+8] ;str_out
            mov ebx, [ebp+12] ;str
            mov ecx, [ebp+16] ;start
            mov eax, [ebp+20] ; end

            add ebx, ecx

.copia:     cmp ecx, eax
            jg .fin2

            mov al, [ebx]
            mov [edx], al

            cmp al, 0
            je .fin2

            inc ebx
            inc edx
            inc ecx
            jmp .copia

.fin2:      mov byte[edx], 0
            pop ebx
            pop ebp
            ret

;;==================================;;

clrBit:

;;==================================;;