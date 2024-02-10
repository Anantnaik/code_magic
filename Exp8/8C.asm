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

input1 db'Enter number of elements:'
i_len1 equ $-input1

input2 db'Enter elements in array:',10
i_len2 equ $-input2

output1 db'Count of even numbers:'
o_len1 equ $-output1

output2 db'Count of odd numbers:'
o_len2 equ $-output2

array times 10 dw 0
len equ 10

newline db 10
tab db 11

section .bss

num resb 10
i resb 10
element resb 10
rem resb 5
n_even resb 5
n_odd resb 5

section .text
global _start
_start:

write input1,i_len1
read num,10
write input2,i_len2
mov byte[n_even],0
mov byte[n_odd],0

mov byte[i],0
mov esi,array

input:

read element,2
mov ebx,[element]
mov [esi],ebx

inc esi
inc byte[i]

mov al,[i]
mov bl,[num]
sub bl,'0'
CMP al,bl
JL input

mov byte[i],0
mov esi,array

check:

mov al,[esi]
mov bl,'2'
sub bl,'0'
div bl

cmp ah,0
JE even 
JMP odd

even:

inc byte[n_even]
JMP loop

odd:

inc byte[n_odd]
JMP loop

loop:
inc esi
inc byte[i]

mov al,[i]
mov bl,[num]
sub bl,'0'
cmp al,bl
JL check 
JE output

output:

add[n_even],byte'0'
add[n_odd],byte'0'

write output1,o_len1
write n_even,5
write newline,1

write output2,o_len2
write n_odd,5
write newline,1

mov eax,1
mov ebx,0
int 80h

