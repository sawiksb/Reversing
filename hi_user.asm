extern printf
extern scanf

section .data
	hi_msg: db "HI!",0
  enter_name_msg: db "Enter your name" ,10,0
	in: db "%s",0
    name: db 10,0

section .text
	global main
	main:
	push ebp
	mov ebp, esp
  
  	push enter_name_msg
	call printf

	push name
	push in 
	call scanf

	push hi_msg
	push in
	call printf

	push name
	push in
	call printf

	leave
	ret