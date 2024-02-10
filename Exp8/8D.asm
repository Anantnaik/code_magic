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

output1 db'Count of numbers above 50:'
o_len1 equ $-output1

output2 db'Count of numbers below 50:'
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
high resb 5
low resb 5

section .text
global _start
_start:

write input1,i_len1
read num,10
write input2,i_len2
mov byte[high],0
mov byte[low],0

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
sub b1,'0'
CMP al,bl
JL input

mov byte[i],0
mov esi,array

check:

mov eax,[esi]
mov [element],eax

mov al,[element]
mov bl,'5'
cmp al,bl

JL Below
JMP Above

Above:

inc byte[high]
JMP loop

Below:

inc byte[low]
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

add [high],byte'0'
add [low],byte'0'

write output1,o_len1
write high,5
write newline,1

write output2,o_len2
write low,5
write newline,1

mov eax,1
mov ebx,0
int 80h
