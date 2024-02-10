%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro read_num 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .bss
	num RESB 4
section .data
	msg1 db 'Enter a number:'
	len1 equ $-msg1
	msg2 db 'Entered number is:'
	len2 equ $-msg2

section .text
	global _start
_start:
	write msg1,len1
	read_num num,4

	write msg2,len2
	write num,4

mov eax,1
int 80h
