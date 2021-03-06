section .data
 	 text1 db "Salve, galera!",10,0
   	 text2 db "Dnv, salve?",10,0

section .text
 	global _start

_start: 
     	mov rax, text1
        call _print
    
      	mov rax, text2
        call _print
 	
	mov rax, 60
        xor rdi, rdi
        syscall

_print:
	push rax
        mov rbx, 0  
_loop:
	inc rax
        inc rbx 
        mov cl, [rax] ; cl is the  8 bits(1 byte) part of the register rcx(64bits),
                      ; it's being used because we have to compare each character 
                      ; of the string, to search for the delimeter 0, and each character 
                      ; have 1 byte(8 bits) of size and the command mov requires that 
                      ; both arguments with same size, in this case 1 byte.
      	cmp cl, 0
        jne _loop
        mov rax, 1
        mov rdi, 1 
      	pop rsi
        mov rdx, rbx
        syscall
        ret

