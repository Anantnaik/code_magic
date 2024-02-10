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

input2 db'Enter elements:',10
i_len2 equ $-input2

input3 db'Enter element to search:',10
i_len3 equ $-input3

output1 db'elements are:',10
o_len1 equ $-output1

output2 db'Element found at index:'
o_len2 equ $-output2

output3 db'Element not found!'
o_len3 equ $-output3

array times 10 dw 0
len equ 10

newline db 10
tab db 11

section .bss

num resb 5
i resb 5
element resb 5
temp resb 5
pos resb 5

section .text
global _start
_start:

write input1,i_len1
read num,5
write input2,i_len2
mov byte[i],0
mov esi,array

input:

read temp,2
mov ebx,[temp]
mov [esi],ebx

inc esi
inc byte[i]

mov al,[i]
mov bl,[num]
sub bl,'0'
CMP al,bl
JE exit_input
JMP input

exit_input:

write input3,i_len3
read element,5

write output1,o_len1
mov byte[i],0
mov esi,array
mov ecx,len

display:

mov ebx,[esi]
mov [temp],ebx
write temp,1
write newline,1
inc esi
inc byte[i]
mov al,[i]
mov bl,[num]
sub bl,'0'
CMP al,bl
JL display
mov byte[i],0
mov esi,array

check:

mov ebx,[esi]
mov [temp],ebx
mov bl,[temp]
mov al,[element]

cmp al,bl
JE found  
JMP not_found

found:

inc byte[i]
mov al,[i]
add al,'0'
mov [pos],al
dec byte[pos]
write output2,o_len2
write pos,5
write newline,1
JMP exit

not_found:

inc esi
inc byte[i]
mov al,[i]
mov bl,[num]
sub bl,'0'
cmp al,bl
JL check
JE fail

fail:

write output3,o_len3
write newline,1
JMP exit
exit:
mov eax,1
mov ebx,0
int 80h




