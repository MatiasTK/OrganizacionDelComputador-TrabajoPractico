global modificarSimboloOca

extern obtenerElemento
extern modificarElemento

section .data
    posX db 1
    posY db 1
section .bss
    simboloOca resq 1
    matrizDir resq 1
    desplazamiento resw 1
section .text
; rdi matrizDir
; rsi simboloOca
modificarSimboloOca:
    sub rax,rax
    mov [matrizDir],rdi
    mov [simboloOca],rsi
    mov byte[posX], 1
    mov byte[posY], 1
reemplazarElementos:
    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]
    sub rsp,8
    call obtenerElemento
    add rsp,8

    cmp al, "O"
    je cambiarSimbolo

    cmp byte[posX], 7
    je avanzarColumna

    inc byte[posX]
    jmp reemplazarElementos
cambiarSimbolo:
    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]
    mov rcx, [simboloOca]

    sub rsp,8
    call modificarElemento
    add rsp,8

    jmp reemplazarElementos
avanzarColumna:
    cmp byte[posY], 7
    je terminar

    mov byte[posX], 1
    inc byte[posY]
    jmp reemplazarElementos
terminar:
    ret