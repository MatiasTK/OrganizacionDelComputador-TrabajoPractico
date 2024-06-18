global main

extern fread
extern fopen
extern printf
extern fclose

section .data
    msgError db "Error al abrir el archivo",0
    filename db  "datos.dat",0
    modo db "rb",0
    format db "ID: %d, Mes: %s", 10, 0
    registro	times 0 	db ""
        id	dw 0
        nombre	times 10	db " ",0
section .bss
    idArchivo resq 1

section .text
main:
    mov rdi, filename
    mov rsi, modo

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    jle error
    mov [idArchivo], rax
read:
    mov rdi, registro
    mov rsi, 12
    mov rdx, 1
    mov rcx, [idArchivo]

    sub rsp,8
    call fread
    add rsp,8

    cmp rax, 0
    jle eof


    mov rdi, format
    sub rsi, rsi
    mov si, [id]
    mov rdx, nombre

    sub rsp,8
    call printf
    add rsp,8

    jmp read
eof:
    mov rdi, [idArchivo]
    sub rsp,8
    call fclose
    add rsp,8

    ret
error:
    mov rdi, msgError
    sub rsp,8
    call printf
    add rsp,8
    ret