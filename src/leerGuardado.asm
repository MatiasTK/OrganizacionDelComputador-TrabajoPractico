global main

extern fwrite
extern fopen
extern printf
extern fclose

section .data
    registro times 0 db ""
        matriz times 49 db " ",0
    filename db  "datos.dat",0
    msgErrorLectura db "ERROR: No se leer el archivo de guardado", 0
    modoLectura db "wb", 0
section .bss
    fileHandler resq 1

section .text
main:
    mov rdi, filename
    mov rsi, modoLectura

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    jle error

    mov [fileHandler], rax
leer:
    mov rdi, registro
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    cmp rax,0
    jle eof

    jmp leer
eof:
    mov rdi, [fileHandler]
    sub rsp,8
    call fclose
    add rsp,8

    jmp fin
error:
    mov rdi, msgErrorLectura
    sub rsp,8
    call printf
    add rsp,8
    jmp fin
fin:
    ret
