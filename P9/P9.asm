section .text
    global suma
    global mystrcmp
    global mystrlen
    global getBit
    global setBit

suma:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    add eax, [ebp+12]

    pop ebp
    ret