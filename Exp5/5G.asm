%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro read 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .bss
	name resw 20
	count resb 5
section .data
	msg1 db 'Enter your name:'
	len1 equ $-msg1

section .text
	global _start
_start:
	write msg1,len1
	read name,20

	mov byte [count],'1'
	jmp loop
loop:
	write count,5
	write name,20

	inc byte [count]
	cmp byte[count],'9'
	jle loop

mov eax,1
mov ebx,0
int 80h
