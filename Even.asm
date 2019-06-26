BITS 32

extern printf

section .data
	msg: db 'Even Numbers are:', 0xa
	len: equ $ -msg
	output: db '%d', 0xa

section .text
	global main

	main:
		push ebp
		mov ebp, esp

		mov ebx, 2

		push msg
		call printf
		add esp, 4

	   L1:
		push ebx
		push output
		call printf
		add esp, 8
		add ebx,2
		cmp ebx, 100
		jle L1

		mov eax, 0		
		mov esp, ebp
		pop ebp
		ret


