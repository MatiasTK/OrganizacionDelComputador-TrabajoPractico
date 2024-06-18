global main

extern fwrite
extern fopen
extern printf
extern fclose

section .data
    msgError db "Error al abrir el archivo",0
    filename db  "datos.dat",0
    modo db "wb",0
    registro times 0 db ""
        dw 2000
        db "Ricardo   ",0

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

    mov rdi, registro; Dir memoria con datos
    mov rsi, 12; Longitud registro, 2(dword) + 10(string byte 10)
    mov rdx, 1; Cantidad registros
    mov rcx, [idArchivo]; File pointer

    sub rsp,8
    call fwrite
    add rsp,8

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