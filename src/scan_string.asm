SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    mov ecx, eax
    mov edx, ebx

    ; TODO:
    ; 1. syscall read
    mov eax, 3
    mov ebx, 0
    int 0x80
 
    ; 2. guardar en buffer
    mov esi, ecx
    add esi, eax
    dec esi

    ; 3. agregar terminador 0
    cmp byte [esi], 10
    jne .add_null

    mov byte [esi], 0
    jmp .done

.add_null:
    mov byte [esi+1], 0

.done:
    mov esp, ebp
    pop ebp
    ret
