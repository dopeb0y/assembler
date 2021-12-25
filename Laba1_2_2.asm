%include "io.inc"
;15, -12, -18
;ответ:16,75
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;заносим переменные в стек
    FLD DWORD [a]
    FLD DWORD [b]
    FDIV  ;a/b(15/(-12)=-1,25)
    FLD DWORD [c]
    FSUB  ;a/b-c(-1,25-(-18)=16,75)
    FST DWORD [r]   ;результат записываем в переменную r
    ret
section .data
a: DD 0x41700000
b: DD 0xC1400000
c: DD 0xC1900000
r: DD 0x00000000
    