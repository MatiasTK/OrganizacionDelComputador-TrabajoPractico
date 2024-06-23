%macro mValidarLimites 0
sub rsp,8
call validarLimites
add rsp,8
%endmacro

%macro mObtenerElemento 0
sub rsp,8
call obtenerElemento
add rsp,8
%endmacro

global estaOcaEncerrada

extern obtenerElemento
extern validarLimites

section .bss
    matrizDir resq 1
    posX resq 1
    posY resq 1
section .text
; rdi matrizDir
; rsi posX
; rdx posY
; rax -> 0 si no esta encerrada, 1 si esta encerrada
estaOcaEncerrada:
    mov [matrizDir], rdi
    mov [posX], rsi
    mov [posY], rdx
    sub rax,rax
    mov rax,0

chequearIzquierda:
    mov rdi, [posX]
    mov rsi, [posY]

    dec rdi

    mValidarLimites

    cmp rax,0
    jne chequearDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi

    mObtenerElemento
    cmp al, " "
    je esValido
    

chequearDerecha:
    mov rdi, [posX]
    mov rsi, [posY]

    inc rdi

    mValidarLimites

    cmp rax,0
    jne chequearArriba

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi

    mObtenerElemento
    cmp al, " "
    je esValido
    

chequearArriba:
    mov rdi, [posX]
    mov rsi, [posY]

    dec rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajo

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rdx

    mObtenerElemento
    cmp al, " "
    je esValido
    

chequearAbajo:
    mov rdi, [posX]
    mov rsi, [posY]

    inc rsi

    mValidarLimites

    cmp rax,0
    jne esValido

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rdx

    mObtenerElemento
    cmp al, " "
    je esValido
    
    cmp al, "-"
    je esInvalido
    

esInvalido:
    mov rax,1
    ret
esValido:
    mov rax,0
    ret