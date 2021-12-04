%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    lea ebx, [s]
    xor dl, dl
 
Next:    
    mov al, [ebx]
    cmp al, 0
    jz Quit
    cmp al, '('
    jnz l1 ; переход на метку, если не равно нулю
    inc dl
l1:
    cmp al, ')'
    jnz l2
    dec dl
    cmp dl, -1
    jz Quit
    
l2:
    inc ebx
    jmp Next
    
Quit:  
    ret
    
    
section .data
    s: db "()()"