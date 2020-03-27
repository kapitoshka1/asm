section	.text
   global _start            ; должно быть объявлено для использования gcc
	
_start:	                    ; сообщаем линкеру входную точку
   mov esi, s1
   mov edi, s2
   mov ecx, lens2
   cld
   repe  cmpsb
   jecxz  equal             ; выполняем прыжок, когда ECX равен нулю
 
   ; Если не равно, то выполняем следующий код
   mov eax, 4
   mov ebx, 1
   mov ecx, msg_neq
   mov edx, len_neq
   int 80h
   jmp exit
	
equal:
   mov eax, 4
   mov ebx, 1
   mov ecx, msg_eq
   mov edx, len_eq
   int 80h
	
exit:
   mov eax, 1
   mov ebx, 0
   int 80h
	
section	.data
s1 db 'Hello, world!',0      ; наша первая строка
lens1 equ $-s1
 
s2 db 'Hello, there!', 0     ; наша вторая строка
lens2 equ $-s2
 
msg_eq db 'Strings are equal!', 0xa
len_eq  equ $-msg_eq
 
msg_neq db 'Strings are not equal!'
len_neq equ $-msg_neq