BITS 32

extern printf

section .data
	msg db 'Hello, world!', 0xa
	len equ $ -msg

section .text
	global main

	main:
		push ebp
		mov ebp, esp

		push msg
		call printf
		add esp, 4

		mov eax, 0
		mov esp, ebp
		pop ebp
		ret
		