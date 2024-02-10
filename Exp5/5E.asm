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

%macro SUM 3
	mov eax,[%1]
	sub eax,'0'
	mov ebx,[%2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov [%3],eax
	int 80h
%endmacro

%macro DIFFERENCE 3
	mov eax,[%1]
	sub eax,'0'
	mov ebx,[%2]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [%3],eax
	int 80h
%endmacro

%macro PRODUCT 3
	mov eax,[%1]
	sub eax,'0'
	mov ebx,[%2]
	sub ebx,'0'
	mul ebx
	add eax,'0'
	mov [%3],eax
	int 80h
%endmacro

%macro DIVIDE 4
	mov al,[%1]
	sub al,'0'
	mov bl,[%2]
	sub bl,'0'
	div bl
	add al,'0'
	mov [%3],al
	add ah,'0'
	mov [%4],ah
	int 80h
%endmacro

section .bss
	num1 resb 1
	num2 resb 1
	res resb 1
	rem resb 1
section .data
	input_text db 'Enter a number:'
	i_len equ $-input_text

	rsum db 'Sum is:'
	rsumlen equ $-rsum

	rdiff db 'Difference is:'
	rdifflen equ $-rdiff

	rmul db 'Product is:'
	rmullen equ $-rmul

	rdiv db 'Division is:'
	rdivlen equ $-rdiv

	rrem db 'Remainder is:'
	rremlen equ $-rrem

	newline db 10

section .text
	global _start
_start:
	write input_text,i_len
	read num1,2
	write input_text,i_len
	read num2,2
	
	SUM num1,num2,res
	write rsum,rsumlen
	write res,1
	write newline,1

	DIFFERENCE num1,num2,res
	write rdiff,rdifflen
	write res,1
	write newline,1

	PRODUCT num1,num2,res
	write rmul,rmullen
	write res,1
	write newline,1

	DIVIDE num1,num2,res,rem
	write rdiv,rdivlen
	write res,1
	write newline,1
	write rrem,rremlen
	write rem,1
	write newline,1

mov eax,1
mov ebx,0
int 80h
