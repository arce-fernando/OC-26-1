section .text
    global suma
    global mystrcmp
    global mystrlen
    global getBit
    global setBit

;;==================================;;

suma:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    add eax, [ebp+12]

    pop ebp
    ret

;;==================================;;

mystrcmp:
    push ebp
    mov ebp, esp
    push esi
    push edi

    mov esi, [ebp+8]   ;primera cad
    mov edi, [ebp+12]  ;segunda cad

COMPARAR:
    mov al, [esi]
    cmp al, [edi]
    jne DIFIERE

    cmp al, 0
    je IGUAL

    inc esi
    inc edi
    jmp COMPARAR

DIFIERE:
    mov eax, 1
    jmp FIN

IGUAL:
    mov eax, 0

FIN:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret

;;==================================;;

mystrlen:
    push ebp
    mov ebp, esp
    push esi
    
    mov esi, [ebp+8]
    mov eax, 0

CONTAR:
    cmp byte[esi], 0
    je FIN_len

    inc eax
    inc esi
    jmp CONTAR

FIN_len:
    pop esi
    mov esp, ebp
    pop ebp
    ret

;;==================================;;
