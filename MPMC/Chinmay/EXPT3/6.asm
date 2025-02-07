section .data
msg db 'Odd numbers from 0 to 9:', 10
msgLen equ $-msg
newline db 10
newlineLen equ $-newline

%macro writesystem 2
    push ecx               
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    pop ecx               
%endmacro

section .bss
output resb 1

section .text
global _start
_start:
    writesystem msg, msgLen

    mov ecx, 1             
print_odd:
    mov eax, ecx
    add eax, '0'           
    mov [output], al       
    writesystem output, 1  
    writesystem newline, newlineLen 
    add ecx, 2             
    cmp ecx, 10            
    jl print_odd

    mov eax, 1             
    mov ebx, 0
    int 80h
