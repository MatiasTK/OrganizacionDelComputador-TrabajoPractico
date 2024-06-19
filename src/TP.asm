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
extern remove
extern fclose
extern strcpy
extern modificarElemento
extern modificarSimboloOca
section .data
    format db "%s",0

    matriz  dw "-","-","O","O","O","-","-"
            dw "-","-","O","O","O","-","-"
            dw "O","O","O","O","O","O","O"
            dw "O"," "," "," "," "," ","O"
            dw "O"," "," ","X"," "," ","O"
            dw "-","-"," "," "," ","-","-"
            dw "-","-"," "," "," ","-","-"
    matrizArriba  dw "-","-","O","O","O","-","-"
                  dw "-","-","O","O","O","-","-"
                  dw "O","O","O","O","O","O","O"
                  dw "O"," "," "," "," "," ","O"
                  dw "O"," "," ","X"," "," ","O"
                  dw "-","-"," "," "," ","-","-"
                  dw "-","-"," "," "," ","-","-"

    matrizDerecha dw "-","-","O","O","O","-","-"
                  dw "-","-"," "," ","O","-","-"
                  dw " "," "," "," ","O","O","O"
                  dw " "," ","X"," ","O","O","O"
                  dw " "," "," "," ","O","O","O"
                  dw "-","-"," "," ","O","-","-"
                  dw "-","-","O","O","O","-","-"

    matrizIzquierda dw "-","-","O","O","O","-","-"
                    dw "-","-","O"," "," ","-","-"
                    dw "O","O","O"," "," "," "," "
                    dw "O","O","O"," ","X"," "," "
                    dw "O","O","O"," "," "," "," "
                    dw "-","-","O"," "," ","-","-"
                    dw "-","-","O","O","O","-","-"

    matrizAbajo dw "-","-"," "," "," ","-","-"
                dw "-","-"," "," "," ","-","-"
                dw "O"," "," ","X"," "," ","O"
                dw "O"," "," "," "," "," ","O"
                dw "O","O","O","O","O","O","O"
                dw "-","-","O","O","O","-","-"
                dw "-","-","O","O","O","-","-"
    msgMovimientoAyuda db "Teclas:",10,"↖ (Q) ↑ (W) ↗ (E)",10,"← (A) ↓ (S) → (D)", 10,"↙ (Z)       ↘ (C)",10,"SALIR (X)",10,0
    msgMovimientoAyudaOca db "Teclas:",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10,0
    msgMovimientoAyudaOcaArriba db "Teclas:",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10,0
    msgMovimientoAyudaOcaDerecha db "Teclas:",10,"      ↑ (W)",10,"← (A) ↓ (S)      ",10,"SALIR (X)",10,0
    msgMovimientoAyudaOcaIzquierda db "Teclas:",10,"      ↑ (W)",10,"← (A) ↓ (S)      ",10,"SALIR (X)",10,0
    msgMovimientoAyudaOcaAbajo db "Teclas:",10,"      ↑ (W)",10,"← (A) ↓ (S)      ",10,"SALIR (X)",10,0
    msgSimboloZorro db "Simbolo actual del zorro: %c",10,"Seleccione un nuevo simbolo: ",0
    msgSimboloOca db "Simbolo actual de la oca: %c",10,"Seleccione un nuevo simbolo: ",0
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
    msgMenuInicioConGuardado db "Seleccione una opcion:", 10, "(1) Nueva partida", 10, "(2) Cargar partida", 10, "(3) Personalizar", 10, "Eleccion:", 0
    msgMenuInicioSinGuardado db "Seleccione una opcion:", 10, "(1) Nueva partida", 10, "(2) Personalizar", 10, "Eleccion:", 0
    msgMenuRotar db "Seleccione una opcion:", 10, "(1) Rotar matriz",10,"(2) Cambiar simbolo zorro",10, "(3) Cambiar simbolo oca",10, "(4) Volver", 10, "Eleccion:",0
    msgMenuRotarDireccion db "Seleccione una opcion:",10,"(1) Rotar a la derecha",10,"(2) Rotar a la izquierda",10,"(3) Rotar a arriba",10, "(4) Rotar a abajo",10,"(5) Volver", 10, "Eleccion:",0
    msgErrorTeclaMenuInicio db "La opcion ingresada no es valida", 10,0
    simboloZorro db "X"
    simboloOca db "O"

    modoLectura db "rb", 0
    modoEscritura db "wb", 0
    filename db  "datos.dat",0; Archivo donde se guardan los datos de la partida

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
borrarGuardado:
    mov rdi, filename
    sub rsp,8
    call remove
    add rsp,8
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
    ;Compruebo si hay partida guardada, para decidir si mostrarlo en el menu
    mov rdi, filename
    mov rsi, modoLectura

    sub rsp, 8
    call fopen
    add rsp, 8
    mov [fileHandler], rax

    ; Comprobar si la llamada a fopen falló
    cmp rax, 0
    je menuInicioSinGuardado

;Hay partida guardada
menuInicioConGuardado:
    mov rdi, msgMenuInicioConGuardado
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
    jmp menuInicioConGuardado

;No habia partida guardada
menuInicioSinGuardado:
    mov rdi, msgMenuInicioSinGuardado
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
    je personalizar

    mov rdi,msgErrorTeclaMenuInicio
    sub rsp,8
    call printf
    add rsp,8
    jmp menuInicioSinGuardado

nuevaPartida:
    ; continua
    ret
cargarPartida:
    sub rsp,8
    call leerGuardado
    add rsp,8
    ret
personalizar:
    mov rdi, msgMenuRotar
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8

    cmp byte [movimientoTecla], '1'
    je rotarMatriz

    cmp byte [movimientoTecla], '2'
    je cambiarSimboloZorro

    cmp byte [movimientoTecla], '3'
    je cambiarSimboloOca

    cmp byte [movimientoTecla], '4'
    je menuInicio

    mov rdi,msgErrorTeclaMenuInicio
    sub rsp,8
    call printf
    add rsp,8

    jmp personalizar
rotarDerecha:
    mov rcx, 98;
    lea rsi, [matrizDerecha]
    lea rdi, [matriz]
    rep movsb


    mov byte[movimientoAtras], 'D'
    mov byte[posXZorro], 3
    mov byte[posYZorro], 4

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaDerecha]
    sub rsp,8
    call strcpy
    add rsp,8

    jmp rotarMatriz
rotarIzquierda:
    mov rcx, 98;
    lea rsi, [matrizIzquierda]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'A'
    mov byte[posXZorro], 5
    mov byte[posYZorro], 4

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaIzquierda]
    sub rsp,8
    call strcpy
    add rsp,8

    jmp rotarMatriz
rotarArrriba:
    mov rcx, 98;
    lea rsi, [matrizArriba]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'W'
    mov byte[posXZorro], 4
    mov byte[posYZorro], 5

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaArriba]
    sub rsp,8
    call strcpy
    add rsp,8

    jmp rotarMatriz
rotarAbajo:
    mov rcx, 98;
    lea rsi, [matrizAbajo]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'S'
    mov byte[posXZorro], 4
    mov byte[posYZorro], 3

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaAbajo]
    sub rsp,8
    call strcpy
    add rsp,8

    jmp rotarMatriz
rotarMatriz:
    sub rdi,rdi
    mov rdi, matriz
    sub rsp,8
    call imprimirMatriz
    add rsp,8

    mov rdi, msgMenuRotarDireccion
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8

    cmp byte [movimientoTecla], '1'
    je rotarDerecha

    cmp byte [movimientoTecla], '2'
    je rotarIzquierda

    cmp byte [movimientoTecla], '3'
    je rotarArrriba

    cmp byte [movimientoTecla], '4'
    je rotarAbajo

    cmp byte [movimientoTecla], '5'
    je personalizar
cambiarSimboloZorro:
    mov rdi, msgSimboloZorro
    mov rsi, [simboloZorro]
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8

    mov al, byte[movimientoTecla]
    mov byte[simboloZorro], al
    jmp personalizar
cambiarSimboloOca:
    mov rdi, msgSimboloOca
    mov rsi, [simboloOca]
    sub rsp,8
    call printf
    add rsp,8

    mov rdi, movimientoTecla
    sub rsp,8
    call gets
    add rsp,8

    mov al, byte[movimientoTecla]
    mov byte[simboloOca], al
    jmp personalizar
main:
    sub rsp,8
    call menuInicio
    add rsp,8

cambiarSimbolos:
    mov rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [simboloZorro]
    sub rsp,8
    call modificarElemento
    add rsp,8

    mov rdi, matriz
    mov rsi, [simboloOca]
    sub rsp,8
    call modificarSimboloOca
    add rsp,8
empezarJuego:
    mov rdi,matriz
    sub rsp,8
    call imprimirMatriz
    add rsp,8

    cmp byte[turnoActual], 'Z'
    jne comenzarMovimientoOca
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
    call borrarGuardado
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
    call borrarGuardado
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

    cmp al, [simboloOca]
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
    mov r9, [simboloOca]
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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]
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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]
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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]
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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloZorro]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloOca]

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
    mov r9, [simboloOca]

    inc rcx

    sub rsp, 8
    call moverElemento
    add rsp, 8

    jmp terminarMovimiento