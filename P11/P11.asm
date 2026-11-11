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
            push edi

            mov edi, [ebp+8] ;str_out
            mov ebx, [ebp+12] ;str
            mov ecx, [ebp+16] ;start
            mov edx, [ebp+20] ; end

            add ebx, ecx

.copia:     cmp ecx, edx
            jg .fin2

            mov al, [ebx]
            mov [edi], al

            cmp al, 0
            je .fin2

            inc ebx
            inc edi
            inc ecx
            jmp .copia

.fin2:      mov byte[edi], 0
            pop edi
            pop ebx
            pop ebp
            ret

;;==================================;;

clrBit:     push ebp
            mov ebp, esp
            
            mov eax, [ebp+8]
            mov ecx, [ebp+12]

            mov edx, 1     ; 0001
            shl edx, 1
            not edx
            and eax, edx

            pop ebp
            ret

;;==================================;;