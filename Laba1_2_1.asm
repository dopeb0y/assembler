%include "io.inc"
;13, 18, 3
; ответ: -2,2(7)
section .text
global CMAIN
CMAIN:
    ;заносим переменные в стек
    FLD DWORD [a]
    FLD DWORD [b]
    FDIV  ;a/b(13/18=0,7(2))
    FLD DWORD [c]
    FSUB  ;a/b-c(0,7(2)-3=-2,2(7))
    FST DWORD [r]   ;результат записываем в переменную r
    ret
section .data
a: DD 0x41500000
b: DD 0x41900000
c: DD 0x40400000
r: DD 0x00000000