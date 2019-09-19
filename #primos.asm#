; *********************************************************************************
; * HCG - Programa en Lenguaje Ensamlador para Linux
; * Agosto 2019
; * En preparación para lo que podría ser mi nueva chamba en Actinver ¿???
; *********************************************************************************
; asm -f elf64 -F dwarf primos.asm -o primos.o ; gcc primos.o -o primos
global main
extern printf

section .data
	log 	db "Register = %08x", 10, 0
	msg 	db "Calculo de números primos en ensamblador", 0x0a
	len	 equ $ - msg
	dw0 	db 100  	; db is 1 bytes
	dw1 	dw 1000 	; dw is 2 bytes
	dw2 	dd 0xffff ; dd is 4 bytes

section .text
main:
	mov 	eax, 4		; sys_write
	mov 	ebx, 1		; stdout file
	mov 	ecx, msg	; ubicacion de la cadena
	mov 	edx, len	; numero de bytes a escribir
	int	0x80  		; system call on eax (en este caso es el fin del programa)

	push 	21
	call	times2
	mov	ebx, eax
	int 	0x80
	
	xor 	rax, rax	; for base = 1 to 10k

loop:
	push 	rax

	push 	rax
	call 	myprintf

	pop 	rax

	inc 	rax	  	; incrementemos
	cmp 	rax, dw2	; comparamos con 10 mil
	jl	loop		; regresemos en caso de ser menor

; salida
	ret

myfunction:
	push 	rbp		; se supone que con esto preservamos el Base-pointer
				; por si alguien lo usa, buena práctica sólamente
	mov 	rbp, rsp	; aquí preservamos el tope del stack
	mov 	eax, [ebp+8]
	add 	eax, eax
	mov 	esp, ebp
	pop 	rbp
	ret

				; printf - https://stackoverflow.com/questions/8194141/
				; how-to-print-a-number-in-assembly-nasm/32853546#32853546 
myprintf:
	push 	rbp
	mov 	rsp, 8

	mov 	esi, 0xffffffff
	lea 	rdi, [rel log]
	xor 	eax, eax
	call 	printf
	
	xor 	rax, rax
	add 	rsp, 8

	pop	rbp
	ret
	
times2:
	push 	rbp
	mov 	rbp, rsp
	
	mov	rax, [rbp+16]
	add	rax, rax
	
	mov	rsp, rbp
	pop	rbp
	ret
	
