BITS 32

extern printf 		;importing printf
extern scanf 		;importing scanf

section .data
	EnterNum: db 'Enter the number of terms:', 10, 0
	outputMsg:db 'The Fibonacci Series are:', 10, 0
	fmt_p: db "%d", 10, 0	;format for printf
	fmt_s: db "%d", 0	    ;format for scanf
	a : dd 0
	b : dd 1

section .text
	global main

	main:
		push ebp			;Prolog
		mov ebp, esp
		sub esp, 12			;Increasing the stack size to 12

		push EnterNum 		;Prints the input statement
		call printf
		add esp, 4			;pops it

		lea eax, [ebp-4]	;First local variable that holds the counter number
		push eax			;push a variable to the stack
		push fmt_s			;data type integer
		call scanf			;scan the number from commandline
		add esp, 8

		push outputMsg 		;Prints the series message
		call printf
		add esp, 4

		mov eax, 0			;Printing 0
		push eax
			;or we can us -push dword[a]- when using variable
		;push dword[a]
		push fmt_p 			;Format for printf( with new-line)
		call printf
		add esp, 8

		mov ebx, 1			;Printing 1
		push ebx
			;or we can us -push dword[b]- when using variable
		;push dword[b]
		push fmt_p 			;Format for printf( with new-line)
		call printf
		add esp, 8


		mov eax, 0				;First fibonacci
		mov ebx, 1				;Second fibonacci 
		sub dword[ebp-4], 2		;Decrementing by 2 coz already 2 numbers 0 and 1 are printed
		;dec dword[ebp-4]		;This statement can be used 2 times or we can use 'sub dword[ebp-4], 2'  it will decrement the counter value by 2
		

	L1:
		mov [ebp-8], ebx		;Storing ebx as second local variable on stack
		add ebx, eax			;sum is stored in ebx
		mov [ebp-12], ebx		;Storing ebx sum value as third local variable on stack

		push ebx				
		push fmt_p
		call printf
		add esp, 8

		mov eax, [ebp-8]
		mov ebx, [ebp-12]
		
		dec dword[ebp-4]		;decrementing the counter value 
		
		cmp dword[ebp-4], 0		;comparing if the counter value has decremented to 0
		jg L1 					;Jump to label L1 if greater than 0
						
		mov esp, ebp			;Epilog
		pop ebp
		ret
