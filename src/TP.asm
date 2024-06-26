%macro mEstaZorroEncerrado 0
sub rsp,8
call estaZorroEncerrado
add rsp,8
%endmacro

%macro mBorrarGuardado 0
sub rsp,8
call borrarGuardado
add rsp,8
%endmacro

%macro mMostrarEstadisticasZorro 0
sub rsp,8
call mostrarEstadisticasZorro
add rsp,8
%endmacro

%macro mSscanf 0
sub rsp,8
call sscanf
add rsp,8
%endmacro

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

%macro mMoverElemento 0
sub rsp,8
call moverElemento
add rsp,8
%endmacro

%macro mMoverSobreOca 0
sub rsp, 8
call moverSobreOca
add rsp, 8
%endmacro

%macro mEstaOcaEncerrada 0
sub rsp,8
call estaOcaEncerrada
add rsp,8
%endmacro

%macro mFread 0
sub rsp,8
call fread
add rsp,8
%endmacro

%macro mFclose 0
sub rsp,8
call fclose
add rsp,8
%endmacro

%macro mPrint 0
sub rsp,8
call printf
add rsp,8
%endmacro

%macro mOpen 0
sub rsp,8
call fopen
add rsp,8
%endmacro

%macro mRemove 0
sub rsp,8
call remove
add rsp,8
%endmacro

%macro  mWrite 0
sub rsp,8
call fwrite
add rsp,8
%endmacro

%macro mSystem 0
sub rsp, 8
call system
add rsp, 8
%endmacro

%macro mGets 0
sub rsp,8
call gets
add rsp,8
%endmacro

%macro mStrcpy 0
sub rsp,8
call strcpy
add rsp,8
%endmacro

%macro mStrlen 0
sub rsp,8
call strLen
add rsp,8
%endmacro

%macro mImprimiMatriz 0
sub rsp,8
call imprimirMatriz
add rsp,8
%endmacro

%macro mLeerGuardado 0
sub rsp,8
call leerGuardado
add rsp,8
%endmacro

%macro mMenuInicio 0
sub rsp,8
call menuInicio
add rsp,8
%endmacro

%macro mModificarElemento 0
sub rsp,8
call modificarElemento
add rsp,8
%endmacro

%macro mModificarSimboloOca 0
sub rsp,8
call modificarSimboloOca
add rsp,8
%endmacro

%macro mCrearGuardado 0
sub rsp,8
call crearGuardado
add rsp,8
%endmacro


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
extern system
section .data
    format db "%s",0

    matriz          dw "-","-","O","O","O","-","-"
                    dw "-","-","O","O","O","-","-"
                    dw "O","O","O","O","O","O","O"
                    dw "O"," "," "," "," "," ","O"
                    dw "O"," "," ","X"," "," ","O"
                    dw "-","-"," "," "," ","-","-"
                    dw "-","-"," "," "," ","-","-"
    matrizArriba    dw "-","-","O","O","O","-","-"
                    dw "-","-","O","O","O","-","-"
                    dw "O","O","O","O","O","O","O"
                    dw "O"," "," "," "," "," ","O"
                    dw "O"," "," ","X"," "," ","O"
                    dw "-","-"," "," "," ","-","-"
                    dw "-","-"," "," "," ","-","-"

    matrizDerecha   dw "-","-","O","O","O","-","-"
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

    matrizAbajo     dw "-","-"," "," "," ","-","-"
                    dw "-","-"," "," "," ","-","-"
                    dw "O"," "," ","X"," "," ","O"
                    dw "O"," "," "," "," "," ","O"
                    dw "O","O","O","O","O","O","O"
                    dw "-","-","O","O","O","-","-"
                    dw "-","-","O","O","O","-","-"
    msgMovimientoAyuda db "Teclas:",10,"↖ (Q) ↑ (W) ↗ (E)",10,"← (A) ↓ (S) → (D)", 10,"↙ (Z)       ↘ (C)",10,"SALIR (X)",10,0
    msgMovimientoAyudaOca db "Teclas:",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10, "ELEGIR OTRA OCA (V)",10,0
    msgMovimientoAyudaOcaArriba db "Teclas:",10,"← (A) ↓ (S) → (D)",10,"SALIR (X)",10, "ELEGIR OTRA OCA (V)",10,0
    msgMovimientoAyudaOcaDerecha db "Teclas:",10,"      ↑ (W)",10,"← (A) ↓ (S)      ",10,"SALIR (X)",10,"ELEGIR OTRA OCA (V)",10,0
    msgMovimientoAyudaOcaIzquierda db "Teclas:",10,"      ↑ (W)",10,"      ↓ (S) → (D)",10,"SALIR (X)",10, "ELEGIR OTRA OCA (V)",10,0
    msgMovimientoAyudaOcaAbajo db "Teclas:",10,"      ↑ (W)",10,"← (A)       → (D)",10,"SALIR (X)",10, "ELEGIR OTRA OCA (V)",10,0
    msgSimboloZorro db "Simbolo actual del zorro: %c",10,"Seleccione un nuevo simbolo: ",0
    msgSimboloOca db "Simbolo actual de la oca: %c",10,"Seleccione un nuevo simbolo: ",0
    msgSalir db "SALIR (X)", 10,0
    msgSeleccion db "Seleccion: ",0
    msgTurnoZorro db "TURNO DEL ZORRO",10,0
    msgOcasComidas db "Cantidad de ocas que se comieron: %i", 10, 0
    msgTurnoOcaRaw db "TURNO DE LA OCA",10,0
    msgOcaFila db "Elige la columna (X) de la oca a controlar: ", 0
    msgOcaColumna db "Elige la fila (Y) de la oca a controlar: ", 0
    msgTurnoOca db "TURNO DE LA OCA en la posicion X:%i Y:%i",10,0
    msgErrorTecla db "ERROR: La tecla ingresada no es valida",10,0
    msgErrorOca db "ERROR: No se puede comer a la oca",10,0
    msgErrorSimbolo db "ERROR: El ingreso no era un caracter", 10,0
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
    clear db "clear",0

    modoLectura db "rb", 0
    modoEscritura db "wb", 0
    filename db  "datos.dat",0

    zorroComio db 0; 0 False, 1 True
    posXZorro db 4
    posYZorro db 5
    posXOca dq 0
    posYOca dq 0
    ocasMatadas dd 0
    turnoActual db "Z"
    movimientoAtras db 'W'
    formatoPos db "%i",0
    cantMovArriba dd 0
    cantMovAbajo dd 0
    cantMovIzquierda dd 0
    cantMovDerecha dd 0
    cantMovArribaIzquierda dd 0
    cantMovArribaDerecha dd 0
    cantMovAbajoIzquierda dd 0
    cantMovAbajoDerecha dd 0
    escrituraBinario db "wb",0

    msgMenuInicioBasico db "Seleccione una opcion:", 10, "(1) Nueva partida", 10, "(2) Personalizar", 10, 0
    msgMenuOpcionGuardado db "(3) Cargar partida", 10, 0
    msgMenuEleccion db "Eleccion:", 0

section .bss
    posXOcaRaw resq 1
    posYOcaRaw resq 1
    movimientoTecla resb 1
    fileHandler resq 1

section .text
; Rutinas
borrarGuardado:
    mov rdi, filename
    mRemove

    jmp terminar
leerGuardado:
    mov rdi, filename
    mov rsi, modoLectura

    mOpen

    cmp rax, 0
    jle errorLectura

    mov [fileHandler], rax
leer:
    ;Leo matriz
    mov rdi, matriz
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo String Movimiento Atras
    mov rdi, msgMovimientoAyudaOca
    mov rsi, 57; (52+4)
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo posX del Zorro
    mov rdi, posXZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo posY del Zorro
    mov rdi, posYZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo ocas comidas
    mov rdi, ocasMatadas
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo turno actual
    mov rdi, turnoActual
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo movimiento hacia atras, que es hacia donde las ocas no pueden ir
    mov rdi, movimientoAtras
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo Simbolo Zorro
    mov rdi, simboloZorro
    mov rsi, 2
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo Simbolo Oca
    mov rdi, simboloOca
    mov rsi, 2
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    ;Leo estadisticas
    mov rdi, cantMovArriba
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovAbajo
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovArribaIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovArribaDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovAbajoIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    mov rdi, cantMovAbajoDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mFread

    cmp rax,0
    jle eof

    jmp leer
eof:
    mov rdi, [fileHandler]
    mFclose
    jmp finLectura
errorLectura:
    mov rdi, msgErrorLectura
    mPrint
    jmp finLectura
finLectura:
    jmp terminar

crearGuardado:
    mov rdi, filename
    mov rsi, modoEscritura

    mOpen

    cmp rax, 0
    jle errorGuardado

    mov [fileHandler], rax

    ;Guardo la matriz
    mov rdi, matriz
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    cmp rax, 1
    jne errorGuardado

    ;Guardo String Movimiento Atras
    mov rdi, msgMovimientoAyudaOca
    mov rsi, 57; (52+4)
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    cmp rax, 1
    jne errorGuardado

    ;Guardo la posX del zorro
    mov rdi, posXZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo la posY del zorro
    mov rdi, posYZorro
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo cantidad de ocas comidas
    mov rdi, ocasMatadas
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo el turno
    mov rdi, turnoActual
    mov rsi, 1
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo la orientacion "hacia atras" a la que no pueden moverse las ocas
    mov rdi, movimientoAtras
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo Simbolo Zorro
    mov rdi, simboloZorro
    mov rsi, 2
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo Simbolo Oca
    mov rdi, simboloOca
    mov rsi, 2
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    ;Guardo estadisticas de movimiento
    mov rdi, cantMovArriba
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovAbajo
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovArribaIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovArribaDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovAbajoIzquierda
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    mov rdi, cantMovAbajoDerecha
    mov rsi, 4
    mov rdx, 1
    mov rcx, [fileHandler]

    mWrite

    cmp rax, 1
    jne errorGuardado

    ;Cierro archivo
    mov rdi, [fileHandler]

    mFclose
    jmp finGuardado
errorGuardado:
    mov rdi, msgErrorEscritura
    mPrint
    jmp finGuardado
finGuardado:
    jmp terminar

menuInicio:
    mov rdi, clear
    mSystem

    ;Compruebo si hay partida guardada, para decidir si mostrarlo en el menu
    mov rdi, filename
    mov rsi, modoLectura

    mOpen
    mov [fileHandler], rax

opcionesMenu:
    ; Opciones basicas
    mov rdi, msgMenuInicioBasico
    mPrint

    ; Comprobar si la llamada a fopen falló, cuyo caso salta el print
    mov rdi, filename
    mov rsi, modoLectura

    mOpen
    mov [fileHandler], rax

    cmp rax, 0
    je continuarMenuSinGuardado

    mov rdi, msgMenuOpcionGuardado
    mPrint
continuarMenuSinGuardado:

    ; Tomo input
    mov rdi, movimientoTecla
    mGets

    cmp byte [movimientoTecla], '1'
    je nuevaPartida

    cmp byte [movimientoTecla], '2'
    je personalizar

    cmp byte [movimientoTecla], '3' ;Chequear si esta opcion esta disponible
    je cargarPartida

MenuTeclaInvalida:
    ; La opcion ingresada no es valida
    mov rdi,msgErrorTeclaMenuInicio
    mPrint
    jmp opcionesMenu


nuevaPartida:
    ; continua
    jmp terminar
cargarPartida:
    ; Esto esta por si elije cargar partida cuando no hay partida cargada
    mov rdi, filename
    mov rsi, modoLectura

    mOpen
    mov [fileHandler], rax
    
    cmp rax, 0
    je MenuTeclaInvalida

    mLeerGuardado
    jmp terminar
personalizar:
    mov rdi, clear
    mSystem

    mov rdi, msgMenuRotar
    mPrint

    mov rdi, movimientoTecla
    mGets

    cmp byte [movimientoTecla], '1'
    je rotarMatriz

    cmp byte [movimientoTecla], '2'
    je cambiarSimboloZorro

    cmp byte [movimientoTecla], '3'
    je cambiarSimboloOca

    cmp byte [movimientoTecla], '4'
    je menuInicio

    mov rdi,msgErrorTeclaMenuInicio
    mPrint

    jmp personalizar
rotarDerecha:
    mov rcx, 98
    lea rsi, [matrizDerecha]
    lea rdi, [matriz]
    rep movsb


    mov byte[movimientoAtras], 'D'
    mov byte[posXZorro], 3
    mov byte[posYZorro], 4

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaDerecha]
    mStrcpy

    jmp rotarMatriz
rotarIzquierda:
    mov rcx, 98
    lea rsi, [matrizIzquierda]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'A'
    mov byte[posXZorro], 5
    mov byte[posYZorro], 4

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaIzquierda]
    mStrcpy

    jmp rotarMatriz
rotarArrriba:
    mov rcx, 98
    lea rsi, [matrizArriba]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'W'
    mov byte[posXZorro], 4
    mov byte[posYZorro], 5

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaArriba]
    mStrcpy

    jmp rotarMatriz
rotarAbajo:
    mov rcx, 98
    lea rsi, [matrizAbajo]
    lea rdi, [matriz]
    rep movsb

    mov byte[movimientoAtras], 'S'
    mov byte[posXZorro], 4
    mov byte[posYZorro], 3

    lea rdi, [msgMovimientoAyudaOca]
    lea rsi, [msgMovimientoAyudaOcaAbajo]
    mStrcpy

    jmp rotarMatriz
rotarMatriz:
    sub rdi,rdi
    mov rdi, matriz
    mImprimiMatriz

rotarMatrizCiclo:
    mov rdi, msgMenuRotarDireccion
    mPrint

    mov rdi, movimientoTecla
    mGets

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

    mov rdi,msgErrorTeclaMenuInicio
    mPrint

    jmp rotarMatrizCiclo
cambiarSimboloZorro:
    mov rdi, msgSimboloZorro
    mov rsi, [simboloZorro]
    mPrint

    mov rdi, movimientoTecla
    mGets

    mov rdi, movimientoTecla
    mStrlen

    cmp rax, 1
    jne simboloInvalidoZorro

    mov al, byte[movimientoTecla]
    mov byte[simboloZorro], al
    jmp personalizar
simboloInvalidoZorro:
    mov rdi, msgErrorSimbolo
    mPrint

    jmp cambiarSimboloZorro
cambiarSimboloOca:
    mov rdi, msgSimboloOca
    mov rsi, [simboloOca]
    mPrint

    mov rdi, movimientoTecla
    mGets

    mov rdi, movimientoTecla
    mStrlen

    cmp rax, 1
    jne simboloInvalidoOca

    mov al, byte[movimientoTecla]
    mov byte[simboloOca], al
    jmp personalizar
simboloInvalidoOca:
    mov rdi, msgErrorSimbolo
    mPrint

    jmp cambiarSimboloOca
main:
    mMenuInicio

cambiarSimbolos:
    mov rdi, matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [simboloZorro]
    mModificarElemento

    mov rdi, matriz
    mov rsi, [simboloOca]
    mModificarSimboloOca
empezarJuego:
    mov rdi,matriz
    mImprimiMatriz

    cmp byte[turnoActual], 'Z'
    jne comenzarMovimientoOca
comenzarMovimiento:
    cmp byte[zorroComio], 0
    je noComio

    mov rdi, msgTurnoZorroKill
    mPrint

    mov byte[zorroComio], 0
noComio:
    mov rdi,msgTurnoZorro
    mPrint

    mov rsi, [ocasMatadas]
    mov rdi, msgOcasComidas
    mPrint

    mov rdi,msgMovimientoAyuda
    mPrint
preguntarMovimiento:
    mov rdi, msgSeleccion
    mPrint

    mov rdi, movimientoTecla
    mGets

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
    mPrint

    jmp preguntarMovimiento
salirTecla:
    mCrearGuardado
    jmp terminar

terminarMovimiento:
    sub rdi,rdi
    mov rdi,matriz
    mImprimiMatriz

    cmp byte[ocasMatadas], 12
    je ganadorZorro

    lea rdi,matriz
    mov rsi, [posXZorro]
    mov rdx, [posYZorro]
    mov rcx, [simboloOca]

    mEstaZorroEncerrado

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

    jmp terminar
ganadorZorro:

    mov rdi, clear
    mSystem

    mov rdi,msgGanadorZorro
    mPrint

    mBorrarGuardado

    mMostrarEstadisticasZorro

    jmp terminar
ganadorOca:

    mov rdi, clear
    mSystem

    mov rdi,msgGanadorOca
    mPrint

    mBorrarGuardado

    mMostrarEstadisticasZorro

    jmp terminar
teclaPosicionInvalidaOca:
    mov rdi,msgErrorPosicionOca
    mPrint
    jmp cambiarTurnoOca
comenzarMovimientoOca:
    mov rdi,msgTurnoOcaRaw
    mPrint
cambiarTurnoOca:

    mov byte[turnoActual], "O"

    mov rdi, msgSalir
    mPrint

    mov rdi, msgOcaFila
    mPrint

    mov rdi, posXOcaRaw
    mGets

    cmp byte[posXOcaRaw], "x"
    je salirTecla

    cmp byte[posXOcaRaw], "X"
    je salirTecla

    mov rdi, msgOcaColumna
    mPrint

    mov rdi, posYOcaRaw
    mGets

    cmp byte[posYOcaRaw], "x"
    je salirTecla

    cmp byte[posYOcaRaw], "X"
    je salirTecla

    sub rdi,rdi
    mov rdi, posXOcaRaw
    mStrlen

    cmp rax,1
    jne teclaPosicionInvalidaOca

    sub rdi,rdi
    mov rdi, posYOcaRaw
    mStrlen

    cmp rax,1
    jne teclaPosicionInvalidaOca

    mov rdi, posXOcaRaw
    mov rsi, formatoPos
    mov rdx, posXOca
    mSscanf

    mov rdi, posYOcaRaw
    mov rsi, formatoPos
    mov rdx, posYOca
    mSscanf

    mov rdi, [posXOca]
    mov rsi, [posYOca]

    mValidarLimites

    cmp rax, 0
    jne ocaInvalida

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    mObtenerElemento

    cmp al, [simboloOca]
    jne ocaElegidaInvalida

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    mEstaOcaEncerrada

    cmp rax, 1
    je ocaEncerrada

    mov rdi,matriz
    mImprimiMatriz

    mov rdi, msgTurnoOca
    mov rsi, [posXOca]
    mov rdx, [posYOca]
    mPrint

    mov rdi, msgMovimientoAyudaOca
    mPrint

    jmp preguntarMovimientoOca
ocaElegidaInvalida:
    mov rdi, msgErrorPosOca
    mPrint
    jmp cambiarTurnoOca
ocaEncerrada:
    mov rdi, msgErrorOcaEncerrada
    mPrint
    jmp cambiarTurnoOca
ocaInvalida:
    mov rdi, msgErrorPosicionOca
    mPrint
    jmp cambiarTurnoOca
validarTecla:
    sub rdi,rdi
    mov rdi, movimientoTecla
    mStrlen

    cmp rax, 1
    jne teclaInvalida

    jmp moverse
teclaInvalida:
    mov rdi,msgErrorTecla
    mPrint
    jmp preguntarMovimiento
movimientoInvalido:
    mov rdi,msgErrorPosicion
    mPrint
    jmp preguntarMovimiento
movimientoInvalidoKill:
    mov rdi,msgErrorOca
    mPrint
    jmp preguntarMovimiento
actualizarZorro:
    mov [posXZorro], rcx
    mov [posYZorro], r8

    mMoverElemento

    jmp terminarMovimiento
volverAJugarZorro:
    mov byte[zorroComio], 1
    mov byte[turnoActual], 'O'; Para que vuelva a jugar el zorro
    jmp actualizarZorro
moverseArriba:
    mov rdi, [posXZorro]
    mov rsi, [posYZorro]
    dec rsi

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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


    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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

    mValidarLimites

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

    mMoverSobreOca

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
    mPrint

    mov rdi, movimientoTecla
    mGets
validarTeclaOca:
    sub rdi,rdi
    mov rdi, movimientoTecla
    mStrlen

    cmp rax, 1
    jne teclaInvalidaOca

    jmp moverseOca
teclaInvalidaOca:
    mov rdi,msgErrorTecla
    mPrint
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

    cmp byte[movimientoTecla], 'v'
    je cambiarTurnoOca

    cmp byte[movimientoTecla], 'V'
    je cambiarTurnoOca

volverAPreguntarOca:
    mov rdi,msgErrorTecla
    mPrint

    jmp preguntarMovimientoOca

    jmp terminar
movimientoInvalidoOca:
    mov rdi,msgErrorPosicion
    mPrint
    jmp preguntarMovimientoOca
movimientoInvalidoOcaOcupado:
    mov rdi,msgErrorMovOca
    mPrint
    jmp preguntarMovimientoOca
moverseArribaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    dec rsi

    mValidarLimites

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    dec rdx
    mObtenerElemento

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

    mMoverElemento

    jmp terminarMovimiento
moverseAbajoOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    inc rsi

    mValidarLimites

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    inc rdx
    mObtenerElemento

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

    mMoverElemento

    jmp terminarMovimiento
moverseIzquierdaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    dec rdi

    mValidarLimites

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    dec rsi
    mObtenerElemento

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

    mMoverElemento

    jmp terminarMovimiento
moverseDerechaOca:
    mov rdi, [posXOca]
    mov rsi, [posYOca]
    inc rdi

    mValidarLimites

    cmp rax, 0
    jne movimientoInvalidoOca

    lea rdi, matriz
    mov rsi, [posXOca]
    mov rdx, [posYOca]

    inc rsi
    mObtenerElemento

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

    mMoverElemento

    jmp terminarMovimiento

terminar:
    ret