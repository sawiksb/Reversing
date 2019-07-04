;find the greatest number from the 2 command line arguments
BITS 32

extern printf
extern scanf
extern atoi

section .data
	;SYS_WRITE equ 1
	;STD_IN equ 1
	;SYS_EXIT equ 60
	;EXIT_CODE equ 0


	error_msg db "Please enter two command line arguments", 10, 0
	Both_equal db "Both the numbers are equal", 10, 0

	first_arg: db "%d", 10, 0
	second_arg: db "%d", 10, 0
	
	fmt_p: db "%d", 10, 0	;format for printf
	fmt_s: db "%d", 0	    ;format for scanf


section .text
	GLOBAL main

	main:
		push ebp
		mov ebp, esp

		mov ecx, dword[ebp+8]	;argc
		cmp ecx, 3
		jl ERROR

		mov esi, dword[ebp+12]	;argv 	
		add esi, 4
		push dword[esi]		;printing argv[1] --> first number
		call atoi
		
		mov [first_arg], eax

		add esi, 4
		push dword[esi]	;printing argv[2] --> second number
		call atoi

		cmp dword[first_arg], eax
		jg GREATER

		;cmp dword[first_arg], eax
		;jl LESSER

		cmp dword[first_arg], eax
		je EQUAL

		push eax
		push fmt_p
		call printf
		add esp, 8
		jmp EXIT

		GREATER:
			push dword[first_arg]
			push fmt_p
			call printf
			add esp, 8
			jmp EXIT

		;LESSER:
		;	push dword[first_arg]
		;	push fmt_p
		;	call printf
		;	add esp, 8
		;	jmp EXIT

		EQUAL:
			push Both_equal
			call printf
			jmp EXIT

		ERROR:
			push error_msg
			call printf
			jmp EXIT 
		
		EXIT:
			leave
			ret







