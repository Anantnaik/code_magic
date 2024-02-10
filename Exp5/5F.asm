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

%macro formula 3
	mov eax,[%1]
	sub eax,'0'
	mov ebx,[%2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[%3],eax
	int 80h
%endmacro

section .bss
	n RESB 4
	a RESB 4
	b RESB 4
	c RESB 4
	i RESB 4

section .data
msg1 db 'Enter a number:'
len1 equ $-msg1
msg2 db 'Fibonacci series:'
len2 equ $-msg2

section .text
	global _start
_start:
	write msg1,len1
	read n,4
	write msg2,len2

	mov byte[i],'0'
	mov byte[a],'0'
	mov byte[b],'1'

	CMP byte[n],'0'
	JE L4
	JMP L1

L1:
write a,4
inc byte[i]
mov al,[i]
CMP al,byte[n]
JE L4
JMP L2

L2:
write b,4
inc byte[i]
mov al,[i]
CMP al,byte[n]
JE L4
JMP L3

L3:
formula a,b,c
write c,4

mov al,[b]
mov [a],al

mov al,[c]
mov [b],al

inc byte[i]
mov al,[i]
CMP al,byte[n]
JE L4
JMP L3

L4:
mov eax,1
int 80h
