extern printf
extern scanf

section .data
	msg: db "Enter a no.",10,0
	integer: dd 0
	in: dd "%d" ,10,0
	char: db "" ,10,0
	str: db "%s" ,10,0

	
section .text
	global main
	
	main:
		push ebp
		mov ebp, esp

		push msg
		call printf

		push integer
		push in
		call scanf

		mov ecx, 1	

	factor:
		mov edx, 0
		mov eax, [integer]
		mov ebx, ecx
		div ebx 
		inc ecx
		cmp edx, 0
		jne factor

	print:
		push ebx
		push in
		call printf

		push char
		push str
		call printf

		mov eax, [integer]
		mov ecx, ebx
		inc ecx
		cmp ebx, eax
		jne factor

		leave
		ret