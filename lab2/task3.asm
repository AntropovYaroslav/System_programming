; task3.asm — треугольник из символа ':' (105 символов)
format ELF64

public _start
public my_exit

ROWS    = 14
CHAR    = ':'

section '.data' writable
    place   db 1

section '.text' executable
_start:
    mov     bl, 1

line_loop:
    cmp     bl, ROWS
    jg      done

    mov     cl, bl
ch_loop:
    mov     dl, CHAR
    mov     byte [place], dl
    push    rcx
    call    print_symb
    pop     rcx
    dec     cl
    jnz     ch_loop

    ; перевод строки
    mov     dl, 0xA
    mov     byte [place], dl
    call    print_symb

    inc     bl
    jmp     line_loop

done:
    call    my_exit

print_symb:
    push    rax
    push    rbx
    push    rcx
    push    rdx
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, place
    mov     edx, 1
    int     0x80
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rax
    ret

section '.my_exit' executable
my_exit:
    mov     eax, 1
    mov     ebx, 0
    int     0x80