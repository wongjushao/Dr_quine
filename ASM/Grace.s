default rel
extern fopen, fprintf, fclose
;Grace is here
%define NAME "Grace_kid.s"
%define SRC "default rel%1$cextern fopen, fprintf, fclose%1$c;Grace is here%1$c%4$cdefine NAME %2$cGrace_kid.s%2$c%1$c%4$cdefine SRC %2$c%3$s%2$c%1$c%4$cmacro Grace 0%1$c%1$cglobal main%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c	sub rsp, 16%1$c%1$c	lea rdi, [filename]%1$c	lea rsi, [mode]%1$c	xor eax, eax%1$c	call fopen wrt ..plt%1$c%1$c	test rax, rax%1$c	jz .error%1$c	mov [rsp], rax%1$c%1$c	mov rdi, [rsp]%1$c	lea rsi, [src]%1$c	mov edx, 10%1$c	mov ecx, 34%1$c	lea r8, [src]%1$c	mov r9d, 37%1$c	xor eax, eax%1$c	call fprintf wrt ..plt%1$c%1$c	mov rdi, [rsp]%1$c	xor eax, eax%1$c	call fclose wrt ..plt%1$c%1$c	xor eax, eax%1$c	leave%1$c	ret%1$c%1$c.error:%1$c	xor eax, eax%1$c	leave%1$c	ret%1$c%4$cendmacro%1$c%1$csection .data%1$c	filename	db NAME, 0%1$c	mode		db %2$cw%2$c, 0%1$c	src			db SRC, 0%1$c%1$csection .text%1$cGrace%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c"
%macro Grace 0

global main
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	lea rdi, [filename]
	lea rsi, [mode]
	xor eax, eax
	call fopen wrt ..plt

	test rax, rax
	jz .error
	mov [rsp], rax

	mov rdi, [rsp]
	lea rsi, [src]
	mov edx, 10
	mov ecx, 34
	lea r8, [src]
	mov r9d, 37
	xor eax, eax
	call fprintf wrt ..plt

	mov rdi, [rsp]
	xor eax, eax
	call fclose wrt ..plt

	xor eax, eax
	leave
	ret

.error:
	xor eax, eax
	leave
	ret
%endmacro

section .data
	filename	db NAME, 0
	mode		db "w", 0
	src			db SRC, 0

section .text
Grace

section .note.GNU-stack noalloc noexec nowrite progbits
