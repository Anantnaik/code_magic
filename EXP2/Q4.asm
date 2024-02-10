section .data
	name db 'Eat Healthy',10
	namelen equ $-name
	
	t1 db'Original String :'
	t1len equ $-t1
	
	t2 db'New String :'
	t2len equ $-t2
section .text
	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,t1
	mov edx,t1len
	int 80h

	mov eax,4
	mov ebx,1	
	mov edx,namelen
	mov ecx,name
	int 80h
	
	mov [name],dword'Stay'
	mov eax,4
	mov ebx,1
	mov ecx,t2
	mov edx,t2len
	int 80h 
	
	mov ebx,1
	mov eax,4
	mov ecx,name
	mov edx,namelen
	int 80h
	
	mov eax,1
	int 80h
