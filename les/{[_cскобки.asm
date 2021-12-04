%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    mov cx, sp
    cld
    lea bx, [s]
next:
    lodsb
    cmp al,0
    jz break
    cmp al,']'
    jnz l1
    cmp al, '}'
    jz l1
    push ax
    jmp next
l1: 
    pop dx 
    sub dx,ax
    cmp dx,2
    jz fail
    jmp next
break:
    cmp cx, sp
    jnz fail
    xor dl,dl
    jmp ok
fail:
    mov dl,1
    mov sp,cx

ok:
    ret

  
section data:
    s: db "[}[]{}"
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    