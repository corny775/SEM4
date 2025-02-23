section .data
    msg1 db "Enter the number:", 0
    greater db "Number is greater than 5", 10
    lesser db "Number is lesser than 5", 10
    equal db "Number is equal equal to", 10
    
    msg1l equ $-msg1
    greaterl equ $-greater
    lesserl equ $-lesser
    equall equ $-equal

%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro input 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro exit 0
    mov eax, 1
    mov ebx, 0
    int 0x80
%endmacro

section .bss
    num1 resb 2
    num2 resb 2

section .text
    global _start

_start:
    print msg1, msg1l
    input num1, 2
   
    mov al, [num1]
    sub al, '0'    

    
    cmp al, 5
    je equal_nums
    jg greater_num
    jl lesser_num

equal_nums:
    print equal, equall
    jmp exit_prog

greater_num:
    print greater,greaterl
    jmp exit_prog

lesser_num:
    print lesser,lesserl
    
exit_prog:
    exit
