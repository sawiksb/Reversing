# assembly
extern printf
extern scanf

section .data
	msg: db "Enter a number (N):",10,0
	in: db "%d",0
    	N: dd 10,0
	

section .text
	global main
	
	main:
		push ebp
		mov ebp, esp

		push msg
		call printf	
	
		push N
		push in 
		call scanf

		mov edx, 0
		mov eax, 0

	l1:
		inc edx
		add eax, edx
		cmp edx, [N]
		jne l1

		push eax
		push in
		call printf

		leave
		ret