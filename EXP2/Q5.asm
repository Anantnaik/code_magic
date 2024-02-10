section .data
	sys_in equ 3
	sys_read equ 2
	sys_write equ 4
	sys_exit equ 1
	input_text db 'Enter The Number:'
	inlen equ $-input_text
	output_text db 'The Roll number is:'
	outlen equ $-output_text

section .bss
	roll_no resb 9

section .text
	global _start
_start:
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,input_text
	mov edx,inlen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,roll_no
	mov edx,9
	int 80h
	
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,output_text
	mov edx,outlen
	int 80h
	
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,roll_no
	mov edx,sys_write
	int 80h

	mov eax,1
	mov ebx,0
	int 80h
