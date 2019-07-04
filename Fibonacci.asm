BITS 32

extern printf
extern scanf

section .data
	EnterNum: db 'Enter the number of terms:', 0xa
	lenEnterNum: equ $ -EnterNum

	outputMsg:db 'The Fibonacci Series are:', 0xa
	lenoutputMsg: equ $ -output

	Integer: dd 0
	Format: db "%d", 0xa, 0
	output: db "%d", 0xa
	a : dd 0
	b : dd 1

section .text
	global main

	main:
		push ebp
		mov ebp, esp

		push EnterNum 		;Prints the input statement
		call printf
		add esp, 4			;pops it

		push Integer		;push a variable to the stack
		push Format			;data type integer
		call scanf			;scan the number from commandline
		add esp, 8

		push Integer
		push Format
		call printf
		add esp, 8

		mov eax, [a]
		mov ebx, [b]
		add eax, ebx
		push eax
		call printf
		add esp, 4

		;push outputMsg		;Prints the Fibonacci Series msg
		;call printf
		;add esp, 4			;pop it


		

		;cmp byte[integer], 1
		;jl Exit
		;mov eax, 0
		;push eax
		;push 


	;L1:
	;   	push ebx
	 ;  	call printf
	  ; 	add esp, 4

	Exit:
		mov eax, 0
		mov esp, ebp
		pop ebp
		ret
