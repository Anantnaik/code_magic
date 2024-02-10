section .data
	sys_in equ 3
	sys_read equ 2
	sys_write equ 4
	sys_exit equ 1
	input_text db 'Enter The number:' 
	i_len equ $-input_text
	output_text db 'The Numbers are:'
	o_len equ $-output_text
section .bss
	num1 resb 4
	num2 resb 4
section .text
	global _start

_start:
	;Print the input message
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,input_text
	mov edx,i_len
	int 80h
	
	;Input number
	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num1
	int 80h
	
	;Print the input message
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,input_text
	mov edx,i_len
	int 80h
	
	; Input number
	mov eax,sys_in 
	mov ebx,sys_read
	mov ecx,num2
	int 80h
	
	; Print the output message
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,output_text
	mov edx,o_len
	int 80h
	
	; Print numbers
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,num1
	mov edx,num2
	int 80h
	mov eax,sys_exit
	mov ebx,0
	int 80h
