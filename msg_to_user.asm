extern printf
extern scanf

section .data
	msg: db "HI!",0
  msg1: db "Enter your name" ,10,0
	in: db "%s",0
    name: db 10,0

section .text
	global main
	main:
	push ebp
	mov ebp, esp
  
  	push msg1
	call printf

	push name
	push in 
	call scanf

	push msg
	push in
	call printf

	push name
	push in
	call printf

	leave
	ret