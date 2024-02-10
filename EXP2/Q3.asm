section .data
	sys_in equ 3
	sys_read equ 2
	sys_write equ 4
	sys_exit equ 1
	hello db 'Hello World',10
	name db 'Have a Nice Day',10
	hellolen equ $-hello
	namelen equ $-name
section .text
	global _start
_start:
	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,hello
	mov edx,hellolen
	int 80h

	mov eax,sys_write
	mov ebx,sys_exit
	mov ecx,name
	mov edx,namelen
	
	mov eax,sys_exit
	mov ebx,0
	int 80h 
