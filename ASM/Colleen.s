default rel

section .data
source db "default rel%1$c%1$csection .data%1$csource db %2$c%3$s%2$c, 0	%1$c;Colleen%1$c%1$csection .text%1$cextern printf%1$cglobal main%1$c%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	;Colleen inside the main function%1$c	lea rdi, [source]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	lea rcx, [source]%1$c	xor rax, rax%1$c	call printf wrt ..plt%1$c%1$c	leave%1$c	ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits", 0	
;Colleen

section .text
extern printf
global main

main:
	push rbp
	mov rbp, rsp

	;Colleen inside the main function
	lea rdi, [source]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [source]
	xor rax, rax
	call printf wrt ..plt

	leave
	ret

section .note.GNU-stack noalloc noexec nowrite progbits