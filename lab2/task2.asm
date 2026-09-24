; task2.asm — матрица 7×15 из символа ':'
format ELF64

public _start
public my_exit

M       = 7
K       = 15
N       = M * K
D       = ':'

section '.bss' writable
    buf     db N dup(D)
    place   db 1

section '.text' executable
_start:
    mov     rsi, buf
    mov     rcx, K

row_loop:
    push    rcx
    mov     rcx, M

col_loop:
    mov     al, [rsi]
    mov     byte [place], al
    push    rcx
    push    rsi
    call    print_symb
    pop     rsi
    pop     rcx
    inc     rsi
    loop    col_loop

    mov     al, 0xA
    mov     byte [place], al
    call    print_symb

    pop     rcx
    loop    row_loop

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