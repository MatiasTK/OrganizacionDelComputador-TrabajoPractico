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

global estaZorroEncerrado
extern obtenerElemento
extern validarLimites

section .bss
    matrizDir resq 1
    simboloOca resq 1
    posX resq 1
    posY resq 1
section .text
; rdi matrizDir
; rsi posX
; rdx posY
; rcx simboloOca
; rax -> 0 si no esta encerrada 1 si esta encerrada
estaZorroEncerrado:
    mov [matrizDir], rdi
    mov [posX], rsi
    mov [posY], rdx
    mov [simboloOca], rcx
    mov rax, 0
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
    je noEstaEncerrado

    cmp al, [simboloOca]
    jne chequearDerecha

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    dec rdi
    dec rdi

    mValidarLimites

    cmp rax,0
    jne chequearDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi
    dec rsi

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
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
    je noEstaEncerrado

    cmp al, [simboloOca]
    jne chequearArriba

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    inc rdi
    inc rdi

    mValidarLimites

    cmp rax,0
    jne chequearArriba

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi
    inc rsi

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
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
    je noEstaEncerrado

    cmp al,[simboloOca]
    jne chequearAbajo

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    dec rsi
    dec rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajo

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rdx
    dec rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
chequearAbajo:
    mov rdi, [posX]
    mov rsi, [posY]

    inc rsi

    mValidarLimites

    cmp rax,0
    jne chequearArribaIzquierda

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado

    cmp al, [simboloOca]
    jne chequearArribaIzquierda

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    inc rsi
    inc rsi

    mValidarLimites

    cmp rax,0
    jne chequearArribaIzquierda

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rdx
    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
chequearArribaIzquierda:
    mov rdi, [posX]
    mov rsi, [posY]

    dec rsi
    dec rdi

    mValidarLimites

    cmp rax,0
    jne chequearArribaDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi
    dec rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado

    cmp al,[simboloOca]
    jne chequearArribaDerecha

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    dec rsi
    dec rsi
    dec rdi
    dec rdi

    mValidarLimites

    cmp rax,0
    jne chequearArribaDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi
    dec rsi
    dec rdx
    dec rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
chequearArribaDerecha:
    mov rdi, [posX]
    mov rsi, [posY]

    inc rdi
    dec rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajoIzquierda

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi
    dec rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado

    cmp al, [simboloOca]
    jne chequearAbajoIzquierda

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    inc rdi
    inc rdi
    dec rsi
    dec rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajoIzquierda

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi
    inc rsi
    dec rdx
    dec rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
chequearAbajoIzquierda:
    mov rdi, [posX]
    mov rsi, [posY]

    dec rdi
    inc rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajoDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi
    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado

    cmp al,[simboloOca]
    jne chequearAbajoDerecha

    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    dec rdi
    dec rdi
    inc rsi
    inc rsi

    mValidarLimites

    cmp rax,0
    jne chequearAbajoDerecha

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    dec rsi
    dec rsi
    inc rdx
    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
chequearAbajoDerecha:
    mov rdi, [posX]
    mov rsi, [posY]

    inc rdi
    inc rsi

    mValidarLimites

    cmp rax,0
    jne estaEncerrado

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi
    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
    ; Chequeo si se la puede comer
    mov rdi, [posX]
    mov rsi, [posY]

    inc rsi
    inc rdi

    mValidarLimites

    cmp rax,0
    jne estaEncerrado

    mov rdi, [matrizDir]
    mov rsi, [posX]
    mov rdx, [posY]

    inc rsi
    inc rsi
    inc rdx
    inc rdx

    mObtenerElemento

    cmp al, " "
    je noEstaEncerrado
estaEncerrado:
    mov rax, 1
    ret
noEstaEncerrado:
    mov rax, 0
    ret
