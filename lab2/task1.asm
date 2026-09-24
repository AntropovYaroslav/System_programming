; task1.asm-вывод строки S в обратном порядке


format ELF64

public _start
public my_exit

section '.data' writable
    S       db 'yyblCMJzdDhDeSKlWGmMX'
    SLen    = 21
    place   db 1

section '.text' executable
_start:
    mov     rsi, S + SLen - 1
    mov     rcx, SLen

rev_loop:
    mov     al, [rsi]
    mov     byte [place], al
    push    rcx
    push    rsi
    call    print_symb
    pop     rsi
    pop     rcx
    dec     rsi
    loop    rev_loop

    mov     al, 0xA
    mov     byte [place], al
    call    print_symb

    call    my_exit

print_symb:
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, place
    mov     edx, 1
    int     0x80
    ret

section '.my_exit' executable
my_exit:
    mov     eax, 1
    mov     ebx, 0
    int     0x80