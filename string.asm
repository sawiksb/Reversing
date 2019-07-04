# assembly
extern printf
extern scanf

section .data
	out: db "%s",0
	msg: db "Enter a string:",10,0
	input: db 10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp

	push msg 
	push out
	call printf

	push input ;scanning the string
	push out
	call scanf

	push input ;printing the string
	push out
	call printf

	leave
	ret