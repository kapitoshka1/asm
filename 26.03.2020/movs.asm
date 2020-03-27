section	.text
   global _start        ; должно быть объявлено для использования gcc
	
_start:	                ; сообщаем линкеру входную точку
   mov	ecx, len
   mov	esi, s1
   mov	edi, s2
   cld
   rep	movsb
	
   mov	edx,20	        ; длина сообщения
   mov	ecx,s2	        ; сообщение для написания
   mov	ebx,1	        ; файловый дескриптор (stdout)
   mov	eax,4	        ; номер системного вызова (sys_write)
   int	0x80	        ; вызов ядра
	
   mov	eax,1	        ; номер системного вызова (sys_exit)
   int	0x80	        ; вызов ядра
	
section .data
s1 db 'Hello, world!',0 ; первая строка
len equ $-s1
 
section	 .bss
s2 resb	20    