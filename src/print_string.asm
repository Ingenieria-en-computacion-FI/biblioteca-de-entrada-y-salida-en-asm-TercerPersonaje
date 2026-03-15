SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    mov esi, eax 
    mov ecx, eax 
    xor edx, edx 

.count:
    cmp byte [ecx], 0
    je .print

    inc ecx
    inc edx
    jmp .count

.print:
    ; 2. syscall write
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    int 0x80

    mov esp, ebp
    pop ebp
    ret
