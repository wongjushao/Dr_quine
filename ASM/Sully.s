default rel
extern fopen, fprintf, fclose, access, system, snprintf

%define SRC "default rel%1$cextern fopen, fprintf, fclose, access, system, snprintf%1$c%1$c%%define SRC %2$c%3$s%2$c%1$c%1$csection .data%1$c    i           dd %4$d%1$c    fmt_name    db %2$cSully_%%d.s%2$c, 0%1$c    fmt_compile db %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o%2$c, 0%1$c    fmt_exec    db %2$c./Sully_%%d%2$c, 0%1$c    mode        db %2$cw%2$c, 0%1$c    filename    times 32 db 0%1$c    compile_cmd times 128 db 0%1$c    exec_cmd    times 64 db 0%1$c    src         db SRC, 0%1$c%1$csection .text%1$cglobal main%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c%1$c    mov eax, [i]%1$c    test eax, eax%1$c    jle .exit%1$c%1$c    lea rdi, [filename]%1$c    mov esi, 32%1$c    lea rdx, [fmt_name]%1$c    mov ecx, [i]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c%1$c    lea rdi, [filename]%1$c    mov esi, 0%1$c    call access wrt ..plt%1$c    test eax, eax%1$c    jnz .write_file%1$c    sub dword [i], 1%1$c%1$c    mov eax, [i]%1$c    test eax, eax%1$c    js .exit%1$c%1$c    lea rdi, [filename]%1$c    mov esi, 32%1$c    lea rdx, [fmt_name]%1$c    mov ecx, [i]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c%1$c.write_file:%1$c    lea rdi, [compile_cmd]%1$c    mov esi, 128%1$c    lea rdx, [fmt_compile]%1$c    mov ecx, [i]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c%1$c    lea rdi, [exec_cmd]%1$c    mov esi, 64%1$c    lea rdx, [fmt_exec]%1$c    mov ecx, [i]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c%1$c    lea rdi, [filename]%1$c    lea rsi, [mode]%1$c    xor eax, eax%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .exit%1$c    mov [rsp], rax%1$c%1$c    mov rdi, [rsp]%1$c    lea rsi, [src]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [src]%1$c    mov r9d, [i]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c%1$c    mov rdi, [rsp]%1$c    call fclose wrt ..plt%1$c%1$c    lea rdi, [compile_cmd]%1$c    call system wrt ..plt%1$c%1$c    lea rdi, [exec_cmd]%1$c    call system wrt ..plt%1$c%1$c.exit:%1$c    leave%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c"

section .data
    i           dd 5
    fmt_name    db "Sully_%d.s", 0
    fmt_compile db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o", 0
    fmt_exec    db "./Sully_%d", 0
    mode        db "w", 0
    filename    times 32 db 0
    compile_cmd times 128 db 0
    exec_cmd    times 64 db 0
    src         db SRC, 0

section .text
global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov eax, [i]
    test eax, eax
    jle .exit

    lea rdi, [filename]
    mov esi, 32
    lea rdx, [fmt_name]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

    lea rdi, [filename]
    mov esi, 0
    call access wrt ..plt
    test eax, eax
    jnz .write_file
    sub dword [i], 1

    mov eax, [i]
    test eax, eax
    js .exit

    lea rdi, [filename]
    mov esi, 32
    lea rdx, [fmt_name]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

.write_file:
    lea rdi, [compile_cmd]
    mov esi, 128
    lea rdx, [fmt_compile]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

    lea rdi, [exec_cmd]
    mov esi, 64
    lea rdx, [fmt_exec]
    mov ecx, [i]
    xor eax, eax
    call snprintf wrt ..plt

    lea rdi, [filename]
    lea rsi, [mode]
    xor eax, eax
    call fopen wrt ..plt
    test rax, rax
    jz .exit
    mov [rsp], rax

    mov rdi, [rsp]
    lea rsi, [src]
    mov edx, 10
    mov ecx, 34
    lea r8, [src]
    mov r9d, [i]
    xor eax, eax
    call fprintf wrt ..plt

    mov rdi, [rsp]
    call fclose wrt ..plt

    lea rdi, [compile_cmd]
    call system wrt ..plt

    lea rdi, [exec_cmd]
    call system wrt ..plt

.exit:
    leave
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
