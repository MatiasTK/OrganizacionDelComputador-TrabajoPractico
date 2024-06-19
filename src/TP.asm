global main
extern imprimirMatriz
extern printf
extern gets
extern strLen
extern moverElemento
extern validarLimites
extern sscanf
extern estaOcaEncerrada
extern estaZorroEncerrado
extern obtenerElemento
extern moverSobreOca
extern fread
extern fwrite
extern fopen
extern fclose


section .data
    format db "%s",0

    registro times 0 db ""
    matriz  dw "-","-","O","O","O","-","-" ; GUARDAR
            dw "-","-","O","O","O","-","-"
            dw "O","O","O","O","O","O","O"
            dw "O"," "," "," "," "," ","O"
            dw "O"," "," ","X"," "," ","O"
            dw "-","-"," "," "," ","-","-"
            dw "-","-"," "," "," ","-","-"
    msgMovimientoAyuda db "Teclas:",10,"↖ (Q) ↑ (W) ↗ (E)",10,"← (A) ↓ (S) → (D)", 10,"↙ (Z)       ↘ (C)",10,"SALIR (X)",10,0
    ;msgMovimientoAyudaOca db "Teclas:",10,"      ↑ (W)",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10,0
    msgMovimientoAyudaOca db "Teclas:",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10,0
    msgSeleccion db "Seleccion: ",0
    msgTurnoZorro db "TURNO DEL ZORRO",10,0
    msgTurnoOcaRaw db "TURNO DE LA OCA",10,0
    msgOcaFila db "Elige la columna (X) de la oca a controlar: ", 0
    msgOcaColumna db "Elige la fila (Y) de la oca a controlar: ", 0
    msgTurnoOca db "TURNO DE LA OCA en la posicion X:%i Y:%i",10,0
    msgErrorTecla db "ERROR: La tecla ingresada no es valida",10,0
    msgErrorOca db "ERROR: No se puede comer a la oca",10,0
    msgErrorPosOca db "ERROR: No hay ninguna oca en la posicion elegida",10,0
    msgErrorMovOca db "ERROR: La oca no se puede mover a esa posicion porque esta ocupada",10,0
    msgErrorOcaEncerrada db "ERROR: La oca esta encerrada y no se puede mover, selecciona otra oca",10,0
    msgErrorPosicion db "ERROR: No te puedes mover a esa posicion",10,0
    msgErrorPosicionOca db "ERROR: La posicion seleccionada no es valida",10,0
    msgErrorLectura db "ERROR: No se pudo leer el archivo de guardado",10,0
    msgErrorEscritura db "ERROR: No se pudo guardar el archivo",10,0
    msgGanadorZorro db "JUEGO FINALIZADO: Gana el zorro por matar a 12 ocas",10,0
    msgGanadorOca db "JUEGO FINALIZADO: Ganan las ocas por encerrar al zorro",10,0
    msgTurnoZorroKill db "El zorro se comio una oca, vuelve a jugar", 10,0
    msgEstadisticasZorro db "ESTADISTICAS DEL ZORRO", 10, "Movimientos hacia arriba: %i", 10, "Movimientos hacia abajo: %i", 10, "Movimientos hacia la izquierda: %i", 10, "Movimientos hacia la derecha: %i", 10, "Movimientos hacia diagonal arriba izquierda: %i", 10, "Movimientos hacia diagonal arriba derecha: %i", 10, "Movimientos hacia diagonal abajo izquierda: %i", 10, "Movimientos hacia diagonal abajo derecha: %i", 10,0
    msgMenuInicio db "Seleccione una opcion:", 10, "(1) Nueva partida", 10, "(2) Cargar partida", 10, "(3) Personalizar", 10, 0
    msgErrorTeclaMenuInicio db "La opcion ingresada no es valida", 10,0

    modoLectura db "rb", 0
    modoEscritura db "wb", 0
    filename db  "datos.dat",0; Archivo donde se guardan los datos de la partida

    msgTest db "Hola estoy por aca ahora", 10, 0

    zorroComio db 0; 0 False, 1 True
    posXZorro db 4; GUARDAR
    posYZorro db 5; GUARDAR
    posXOca dq 0
    posYOca dq 0
    ocasMatadas db 11; 1) TODO: RESTAURAR 2) GUARDAR
    turnoActual db "Z"; GUARDAR
    movimientoAtras db 'W'; 1) Siempre en uppercase 2) GUARDAR
    formatoPos db "%i",0
    cantMovArriba dd 0; GUARDAR
    cantMovAbajo dd 0; GUARDAR
    cantMovIzquierda dd 0; GUARDAR
    cantMovDerecha dd 0; GUARDAR
    cantMovArribaIzquierda dd 0; GUARDAR
    cantMovArribaDerecha dd 0; GUARDAR
    cantMovAbajoIzquierda dd 0; GUARDAR
    cantMovAbajoDerecha dd 0; GUARDAR
    escrituraBinario db "wb",0

section .bss
    posXOcaRaw resq 1
    posYOcaRaw resq 1
    movimientoTecla resb 1
    fileHandler resq 1


section .text
; Rutinas
leerGuardado:
    mov rdi, filename
    mov rsi, modoLectura

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    jle errorLectura

    mov [fileHandler], rax
leer:
    ;Leo matriz
    mov rdi, matriz
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1 ; !! No deberia ser rsi 2 (tamanio) y rdx 49 (cantidad)?
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo posX del Zorro
    mov rdi, posXZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo posY del Zorro
    mov rdi, posYZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo ocas comidas
    mov rdi, ocasMatadas
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo turno actual
    mov rdi, turnoActual
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo movimiento hacia atras, que es hacia donde las ocas no pueden ir
    mov rdi, movimientoAtras
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    ;Leo estadisticas
    mov rdi, cantMovArriba
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovAbajo
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovArribaIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovArribaDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovAbajoIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    mov rdi, cantMovAbajoDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fread
    add rsp,8

    cmp rax,0
    jle eof

    jmp leer
eof:
    mov rdi, [fileHandler]
    sub rsp,8
    call fclose
    add rsp,8

    jmp finLectura
errorLectura:
    mov rdi, msgErrorLectura
    sub rsp,8
    call printf
    add rsp,8
    jmp finLectura
finLectura:
    ret

crearGuardado:
    mov rdi, filename
    mov rsi, modoEscritura

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    jle errorGuardado

    mov [fileHandler], rax

    ;Guardo la matriz
    mov rdi, matriz
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1;  !! No deberia ser rsi 2 (tamanio) y rdx 49 (cantidad)?
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    cmp rax, 1
    jne errorGuardado

    ;Guardo la posX del zorro
    mov rdi, posXZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    ;Guardo la posY del zorro
    mov rdi, posYZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    ;Guardo cantidad de ocas comidas
    mov rdi, ocasMatadas
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    ;Guardo el turno
    mov rdi, turnoActual
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    ;Guardo la orientacion "hacia atras" a la que no pueden moverse las ocas
    mov rdi, movimientoAtras
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    ;Guardo estadisticas de movimiento
    mov rdi, cantMovArriba
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovAbajo
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovArribaIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovArribaDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovAbajoIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, cantMovAbajoDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    cmp rax, 1
    jne errorGuardado

    ;Cierro archivo
    mov rdi, [fileHandler]

    sub rsp,8
    call fclose
    add rsp,8

    jmp finGuardado
errorGuardado:
    mov rdi, msgErrorEscritura
    sub rsp,8
    call printf
    add rsp,8
    jmp finGuardado
finGuardado:
    ret

menuInicio:
    mov rdi, msgMenuInicio
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8

    cmp byte [movimientoTecla], '1'
    je nuevaPartida

    cmp byte [movimientoTecla], '2'
    je cargarPartida

    cmp byte [movimientoTecla], '3'
    je personalizar

    mov rdi,msgErrorTeclaMenuInicio
    sub rsp,8
    call printf
    add rsp,8
    jmp menuInicio

nuevaPartida:
    ; continua
    ret
cargarPartida:
    sub rsp,8
    call leerGuardado
    add rsp,8
    ret
personalizar:
    ; !! Falta implementar
    ret

main:
    sub rsp,8
    call menuInicio
    add rsp,8

    mov rdi,matriz
    sub rsp,8
    call imprimirMatriz
    add rsp,8


comenzarMovimiento:
    cmp byte[zorroComio], 0
    je noComio

    mov rdi, msgTurnoZorroKill
    sub rsp,8
    call printf
    add rsp,8

    mov byte[zorroComio], 0
noComio:
    mov rdi,msgTurnoZorro
    sub rsp,8
    call printf
    add rsp,8

    mov rdi,msgMovimientoAyuda
    sub rsp,8
    call printf
    add rsp,8
preguntarMovimiento:
    mov rdi, msgSeleccion
    sub rsp,8
    call printf
    add rsp,8

    sub rsp,8
    mov rdi, movimientoTecla
    call gets
    add rsp,8

    jmp validarTecla
moverse:
; Casos moverse direcciones, si no cumple ninguna letra entonces es un error.
    cmp byte [movimientoTecla], 'W'
    je moverseArriba

    cmp byte[movimientoTecla], 'w'
    je moverseArriba

    cmp byte [movimientoTecla], 'S'
    je moverseAbajo

    cmp byte [movimientoTecla], 's'
    je moverseAbajo

    cmp byte [movimientoTecla], 'A'
    je moverseIzquierda

    cmp byte[movimientoTecla], 'a'
    je moverseIzquierda

    cmp byte [movimientoTecla], 'D'
    je moverseDerecha

    cmp byte[movimientoTecla], 'd'
    je moverseDerecha

    cmp byte [movimientoTecla], 'Q'
    je moverseArribaIzquierda

    cmp byte[movimientoTecla], 'q'
    je moverseArribaIzquierda

    cmp byte [movimientoTecla], 'E'
    je moverseArribaDerecha

    cmp byte[movimientoTecla], 'e'
    je moverseArribaDerecha

    cmp byte [movimientoTecla], 'Z'
    je moverseAbajoIzquierda

    cmp byte[movimientoTecla], 'z'
    je moverseAbajoIzquierda

    cmp byte [movimientoTecla], 'C'
    je moverseAbajoDerecha

    cmp byte[movimientoTecla], 'c'
    je moverseAbajoDerecha

    cmp byte [movimientoTecla], 'X'
    je salirTecla

    cmp byte[movimientoTecla], 'x'
    je salirTecla

    mov rdi,msgErrorTecla
    sub rsp,8
    call printf
    add rsp,8

    jmp preguntarMovimiento
salirTecla:
    sub rsp,8
    call crearGuardado
    add rsp,8
    ret
terminarMovimiento:
    sub rdi,rdi
    mov rdi,matriz
    sub rsp,8
    call imprimirMatriz
    add rsp,8

    cmp byte[ocasMatadas], 12
    je ganadorZorro

    lea rdi,matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]

    sub rsp,8
    call estaZorroEncerrado
    add rsp,8

    cmp rax, 1
    je ganadorOca

    cmp byte[turnoActual], 'Z'
    je comenzarMovimientoOca

    mov byte[turnoActual], 'Z'
    jmp comenzarMovimiento

mostrarEstadisticasZorro:
    mov rdi, msgEstadisticasZorro
    mov rsi, [cantMovArriba]
    mov rdx, [cantMovAbajo]
    mov rcx, [cantMovIzquierda]
    mov r8, [cantMovDerecha]
    mov r9, [cantMovArribaIzquierda]

    ; Solo dios sabe lo que sucede aca
    sub rsp,24
    mov rax, 0
    mov rax, qword [cantMovArribaDerecha]
    mov [rsp], rax
    mov rax, qword [cantMovAbajoIzquierda]
    mov [rsp+8], rax
    mov rax, qword [cantMovAbajoDerecha]
    mov [rsp+16], rax

    call printf
    add rsp,24

    add rsp, 16

    ret
ganadorZorro:
    mov rdi,msgGanadorZorro
    sub rsp,8
    call printf
    add rsp,8

    sub rsp,8
    call mostrarEstadisticasZorro
    add rsp,8

    ret
ganadorOca:
    mov rdi,msgGanadorOca
    sub rsp,8
    call printf
    add rsp,8

    sub rsp,8
    call mostrarEstadisticasZorro
    add rsp,8

    ret
teclaPosicionInvalidaOca:
    mov rdi,msgErrorPosicionOca
    sub rsp,8
    call printf
    add rsp,8
    jmp cambiarTurnoOca
comenzarMovimientoOca:
    mov rdi,msgTurnoOcaRaw
    sub rsp,8
    call printf
    add rsp,8
cambiarTurnoOca:
    mov rdi, msgOcaFila
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, posXOcaRaw
    sub rsp,8
    call gets
    add rsp,8

    mov rdi, msgOcaColumna
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, posYOcaRaw
    sub rsp,8
    call gets
    add rsp,8

    sub rdi,rdi
    mov rdi, posXOcaRaw
    sub rsp,8
    call strLen
    add rsp,8

    cmp rax,1
    jne teclaPosicionInvalidaOca

    sub rdi,rdi
    mov rdi, posYOcaRaw
    sub rsp,8
    call strLen
    add rsp,8

    cmp rax,1
    jne teclaPosicionInvalidaOca

    mov rdi, posXOcaRaw
    mov rsi, formatoPos
    mov rdx, posXOca
    sub rsp,8
    call sscanf
    add rsp,8

    mov rdi, posYOcaRaw
    mov rsi, formatoPos
    mov rdx, posYOca
    sub rsp,8
    call sscanf
    add rsp,8

    mov rdi, [posXOca]
    mov rsi, [posYOca]

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne ocaInvalida

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    sub rsp,8
    call obtenerElemento
    add rsp,8

    cmp al, "O"
    jne ocaElegidaInvalida

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    sub rsp,8
    call estaOcaEncerrada
    add rsp,8

    cmp rax, 1
    je ocaEncerrada

    mov byte[turnoActual], "O"

    mov rdi,matriz
    sub rsp,8
    call imprimirMatriz
    add rsp,8

    mov rdi, msgTurnoOca
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, msgMovimientoAyudaOca
    sub rsp,8
    call printf
    add rsp,8

    jmp preguntarMovimientoOca
ocaElegidaInvalida:
    mov rdi, msgErrorPosOca
    sub rsp,8
    call printf
    add rsp,8
    jmp cambiarTurnoOca
ocaEncerrada:
    mov rdi, msgErrorOcaEncerrada
    sub rsp,8
    call printf
    add rsp,8
    jmp cambiarTurnoOca
ocaInvalida:
    mov rdi, msgErrorPosicionOca
    sub rsp,8
    call printf
    add rsp,8
    jmp cambiarTurnoOca
validarTecla:
    sub rdi,rdi
    mov rdi, movimientoTecla
    sub rsp,8
    call strLen
    add rsp,8

    cmp rax, 1
    jne teclaInvalida

    jmp moverse
teclaInvalida:
    mov rdi,msgErrorTecla
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimiento
movimientoInvalido:
    mov rdi,msgErrorPosicion
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimiento
movimientoInvalidoKill:
    mov rdi,msgErrorOca
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimiento
actualizarZorro:
    mov [posXZorro], rcx
    mov [posYZorro], r8

    sub rsp,8
    call moverElemento
    add rsp,8

    jmp terminarMovimiento
volverAJugarZorro:
    mov byte[zorroComio], 1
    mov byte[turnoActual], 'O'; Para que vuelva a jugar el zorro
    jmp actualizarZorro
moverseArriba:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    dec rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    dec rdx
    dec r8
    dec r8

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    dec r8

    inc byte[cantMovArriba]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    dec r8
    jmp volverAJugarZorro
moverseAbajo:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    inc rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    inc rdx
    inc r8
    inc r8

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    inc r8

    inc byte[cantMovAbajo]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    inc r8
    jmp volverAJugarZorro

moverseIzquierda:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    dec rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    dec rsi
    dec rcx
    dec rcx

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    dec rcx

    inc byte[cantMovIzquierda]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    dec rcx
    jmp volverAJugarZorro
moverseDerecha:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    inc rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    inc rsi
    inc rcx
    inc rcx

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    inc rcx

    inc byte[cantMovDerecha]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    inc rcx
    jmp volverAJugarZorro
moverseArribaIzquierda:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    dec rsi
    dec rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]

    dec rsi
    dec rdx

    dec rcx
    dec rcx
    dec r8
    dec r8


    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    dec rcx
    dec r8

    inc byte[cantMovArribaIzquierda]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    dec rcx
    dec r8
    jmp volverAJugarZorro
moverseArribaDerecha:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    dec rsi
    inc rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]

    inc rsi
    dec rdx

    inc rcx
    inc rcx
    dec r8
    dec r8

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    inc rcx
    dec r8

    inc byte[cantMovArribaDerecha]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    inc rcx
    dec r8
    jmp volverAJugarZorro
moverseAbajoIzquierda:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    inc rdi
    dec rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]

    dec rsi
    inc rdx

    dec rcx
    dec rcx
    inc r8
    inc r8

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    dec rcx
    inc r8

    inc byte[cantMovAbajoIzquierda]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    dec rcx
    inc r8
    jmp volverAJugarZorro
moverseAbajoDerecha:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    inc rdi
    inc rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalido

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]

    inc rsi
    inc rdx

    inc rcx
    inc rcx
    inc r8
    inc r8

    sub rsp, 8
    call moverSobreOca
    add rsp, 8

    cmp rax,0
    jl movimientoInvalidoKill

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [posXZorro]
    mov r8, [posYZorro]
    mov r9, "X"

    inc rcx
    inc r8

    inc byte[cantMovAbajoDerecha]

    cmp rax,0
    je actualizarZorro

    inc byte[ocasMatadas]
    inc rcx
    inc r8
    jmp volverAJugarZorro
preguntarMovimientoOca:
    mov rdi, msgSeleccion
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8
validarTeclaOca:
    sub rdi,rdi
    mov rdi, movimientoTecla
    sub rsp,8
    call strLen
    add rsp,8

    cmp rax, 1
    jne teclaInvalidaOca

    jmp moverseOca
teclaInvalidaOca:
    mov rdi,msgErrorTecla
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimientoOca
moverseOca:
    sub rax,rax
    mov al, [movimientoAtras]

    cmp byte [movimientoTecla], al
    je volverAPreguntarOca

    add al, 32; To lowercase

    cmp byte [movimientoTecla], al
    je volverAPreguntarOca

    cmp byte [movimientoTecla], 'W'
    je moverseArribaOca

    cmp byte[movimientoTecla], 'w'
    je moverseArribaOca

    cmp byte [movimientoTecla], 'S'
    je moverseAbajoOca

    cmp byte [movimientoTecla], 's'
    je moverseAbajoOca

    cmp byte [movimientoTecla], 'A'
    je moverseIzquierdaOca

    cmp byte[movimientoTecla], 'a'
    je moverseIzquierdaOca

    cmp byte [movimientoTecla], 'D'
    je moverseDerechaOca

    cmp byte[movimientoTecla], 'd'
    je moverseDerechaOca

    cmp byte [movimientoTecla], 'X'
    je salirTecla

    cmp byte[movimientoTecla], 'x'
    je salirTecla

volverAPreguntarOca:
    mov rdi,msgErrorTecla
    sub rsp,8
    call printf
    add rsp,8

    jmp preguntarMovimientoOca

    ret
movimientoInvalidoOca:
    mov rdi,msgErrorPosicion
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimientoOca
movimientoInvalidoOcaOcupado:
    mov rdi,msgErrorMovOca
    sub rsp,8
    call printf
    add rsp,8
    jmp preguntarMovimientoOca
moverseArribaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    dec rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    dec rdx
    sub rsp, 8
    call obtenerElemento
    add rsp, 8

    cmp al, " "
    jne movimientoInvalidoOcaOcupado

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    mov rcx, [posXOca]
    mov r8, [posYOca]
    mov r9, "O"

    dec r8

    sub rsp, 8
    call moverElemento
    add rsp, 8

    jmp terminarMovimiento
moverseAbajoOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    inc rsi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    inc rdx
    sub rsp, 8
    call obtenerElemento
    add rsp, 8

    cmp al, " "
    jne movimientoInvalidoOcaOcupado

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    mov rcx, [posXOca]
    mov r8, [posYOca]
    mov r9, "O"

    inc r8

    sub rsp, 8
    call moverElemento
    add rsp, 8

    jmp terminarMovimiento
moverseIzquierdaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    dec rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    dec rsi
    sub rsp, 8
    call obtenerElemento
    add rsp, 8

    cmp al, " "
    jne movimientoInvalidoOcaOcupado

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    mov rcx, [posXOca]
    mov r8, [posYOca]
    mov r9, "O"

    dec rcx

    sub rsp, 8
    call moverElemento
    add rsp, 8

    jmp terminarMovimiento
moverseDerechaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    inc rdi

    sub rsp,8
    call validarLimites
    add rsp,8

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    inc rsi
    sub rsp, 8
    call obtenerElemento
    add rsp, 8

    cmp al, " "
    jne movimientoInvalidoOcaOcupado

    sub rdi, rdi
    sub rsi,rsi

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    mov rcx, [posXOca]
    mov r8, [posYOca]
    mov r9, "O"

    inc rcx

    sub rsp, 8
    call moverElemento
    add rsp, 8

    jmp terminarMovimiento