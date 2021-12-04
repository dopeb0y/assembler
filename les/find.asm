%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    ;ebx адрес массива
    ;ecx min
    ;max edi
    ;guesi esi
    ;x dl
    mov dl,2
    Lea ebx , [A]
    xor Ecx,ecx
    mov edi, 7
    
next:
    cmp ecx,edi;сравниваем если оно больше
    Ja fail
    mov esi,ecx ; gest min-max\2
    add esi, edi
    shr esi,1
    mov al, [ebx+esi]
    cmp al,dl
    je found
    jl less
    mov edi ,esi
    dec edi
    jmp next

less:
    mov ecx,esi
    inc ecx
    jmp next
          
fail:
      
    ret
found:
    ret
    
    
section .data
A: DB 1, 5, 7, 8, 10, 14, 21, 35