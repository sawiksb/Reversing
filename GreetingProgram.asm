%macro write_string 2   	;defining macro for output terminal
	mov eax, 4			;sys_write
	mov ebx, 1			;stdout
	mov ecx, %1			;moving value of ‘msg’ to ECX register
	mov edx, %2			;
	int 80h				;system interrupt
%endmacro

section .data	;declatring variables with initialized values
	userMsg db 'Please enter your name:', 0xa
	lenUserMsg equ $ -userMsg
	dispMsg db 'Good Morning, '
	lenDispMsg equ $ -dispMsg

section .bss	  ;declaring variables with uninitialised data
	num resb 20

section .text		;starting of main operations/code
	global main
	main:
		write_string userMsg,lenUserMsg
		mov eax, 3
		mov ebx, 0
		mov ecx, num
		mov edx, 20
		int 80h

write_string dispMsg, lenDispMsg	;calling macro for output
write_string num, 20				;calling macro for output
	mov eax, 1						;exiting system call
	int 80h