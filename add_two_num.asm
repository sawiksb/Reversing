# assembly
extern printf
extern scanf

section .data
	in: db "%d",0
	msg: db "Enter 2 nos.",0
	integer1:  times 4 db 0
	integer2:  times 4 db 0
	out: db "%s" ,10,0
	

section .text
	global main
	
	main:
	push ebp
	mov ebp, esp

	push msg
	push out
	call printf

 	push integer1 ;input for 1st integer
 	push in
 	call scanf

 	push integer2 ;input for 2nd integer
 	push in
 	call scanf

 	mov eax,dword [integer1]
 	mov ebx,dword [integer2]
 	add eax,ebx ;addition of integers
	push eax
 	push in
 	call printf

 	leave
	ret