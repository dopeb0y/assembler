%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov dx, 5
    call fib
    PRINT_DEC 1,al
    
    ret
    
    
fib:
    push bx; push A / pop A
    push cx
    cmp dx,2
    ja l1
    mov ax,1
    jmp Q

l1: 
    mov cx,dx
    mov ax, 1
    mov bx, 1
next:
    add ax,bx
    xor ax, bx
    xor bx, ax
    xor ax, bx
    loop next
Q:
    pop cx
    pop bx
    ret
        