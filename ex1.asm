; *********************************************************************************
; * HCG - Programa en Lenguaje Ensamlador para Linux
; * Agosto 2019
; * En preparación para lo que podría ser mi nueva chamba en Actinver
; *********************************************************************************
; obtenido de: https://www.youtube.com/watch?v=wLXIWKUWpSs
; compilar 32 bit con: nasm -f elf32 ex1.asm -o ex1.o ; ld -m elf_i386 ex1.o -o ex1
; compilar 64 bit con: nasm -f elf64 ex1.asm -o ex1.o ; ld -m elf_x86_64 ex1.o -o ex1
global _start

section .data
	msg db "Sup Meng!", 0x0a
	len equ $ - msg

section .text
_start:
	mov eax, 100	; acumulador
	sub eax, 13		; resta
	add eax, 26		; sumaa
	
	mov rbx, dword 2	
	mul ebx 			; multiplica el acumulador por la base
	div ebx 			; divide el acumulador por la base
	clc						; calaca
	inc eax

	mov eax, 4		; sys_write
	mov ebx, 1		; stdout file
	mov ecx, msg	; ubicacion de la cadena
	mov edx, len	; numero de bytes a escribir
	int 0x80  		; system call on eax (en este caso es el fin del programa)

	mov rax, 1 		; número de interrupción
	mov rbx, QWORD 42 	; código de salida
	inc bl				; 8 bit : 43
	inc bx				; 16 bit : 44
	inc ebx				; 32 bit : 45
	inc rbx				; 64 bit : 46
	int 0x80  		; system call on eax (en este caso es el fin del programa)


