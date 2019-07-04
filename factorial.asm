# assembly
extern printf
extern scanf

section .data
	msg: db "Enter a number (N):",10,0
	inp: db "%d",0
    	N: dd 10,0
	

section .text
	global main
	
	main:
		push ebp
		mov ebp, esp

		push msg
		call printf	
		
		push N
		push inp 
		call scanf
		
		mov edx,[N]
		cmp edx, 0
		je res

		mov ebx, 1
		

	li:
		imul ebx, edx
		dec edx
		cmp edx, 1
		jne li
		je print

		res:
		mov ebx, 1

		print:
		push ebx
		push inp
		call printf
		

		leave
		ret