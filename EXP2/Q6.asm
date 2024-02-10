section .data
	input_text db 'Enter your name:'
	 i_len equ $-input_text
	 
	output_text db 'Entered name is:'
	o_len equ $-output_text
section .bss
	len resw 20
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1	
	mov ecx,input_text
	mov edx,i_len
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,len 
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,output_text
	mov edx,o_len 
	int 80h
	
	mov eax,4
	mov ebx, 1
	mov ecx,len
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
