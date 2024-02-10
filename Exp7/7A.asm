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

section .data

input db'Enter a number:'
i_len equ $-input

text db'Sum of 2 number:'
len equ $-text

section .bss
num1 resb 5
num2 resb 5
Sum resb 5

section .text
global _start
_start:

write input,i_len
read num1,5
write input,i_len
read num2,5

;addition
mov esi,2
mov ecx,3

clc
add_loop:

mov al,[num1+esi]
adc al,[num2+esi]
aaa
pushf
or al,30h
popf

mov [Sum+esi],al
dec esi
loop add_loop

write text,len
write Sum,5

mov eax,1
mov ebx,0
int 80h




