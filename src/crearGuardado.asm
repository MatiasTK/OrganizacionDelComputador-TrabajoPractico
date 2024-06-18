global main

extern fwrite
extern fopen
extern printf
extern fclose

section .data
    registro times 0 db ""
        matriz dw "-","-"," "," "," ","-","-"
               dw "-","-","O","O","O","-","-"
               dw "O"," "," "," "," "," ","O"
               dw "O"," ","O","O","O"," ","O"
               dw "O"," ","O","X","O"," ","O"
               dw "-","-"," ","O"," ","-","-"
               dw "-","-"," "," "," ","-","-"
    filename db  "datos.dat",0
    msgErrorEscritura db "ERROR: No se pudo guardar el archivo", 0
    modoEscritura db "wb", 0
section .bss
    fileHandler resq 1

section .text
main:
    mov rdi, filename
    mov rsi, modoEscritura

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    jle error

    mov [fileHandler], rax

    mov rdi, registro
    mov rsi, 98; (7*7=49) * 2(Dword) = 98
    mov rdx, 1
    mov rcx, [fileHandler]

    sub rsp,8
    call fwrite
    add rsp,8

    cmp rax, 1
    jne error

    mov rdi, [fileHandler]

    sub rsp,8
    call fclose
    add rsp,8

    jmp fin
error:
    mov rdi, msgErrorEscritura
    sub rsp,8
    call printf
    add rsp,8
    jmp fin
fin:
    ret
