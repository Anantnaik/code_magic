%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data
	msg1 db '5'
	len1 equ $-msg1
	msg2 db '8'
	len2 equ $-msg2

section .text
	global _start
_start:
	write msg1,len1

	write msg2,len2

mov eax,1
int 80h
