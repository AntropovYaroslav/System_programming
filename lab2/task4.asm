; task4.asm — сумма цифр числа N=5447175926
format ELF64

public _start
public my_exit

section '.data' writable
    num     db '5447175926'
    nlen    = $ - num
    place   db 1

section '.text' executable
_start:
    mov     rsi, num
    mov     rcx, nlen
    xor     rbx, rbx              

sum_loop:
    movzx   ax, byte [rsi]          
    sub     ax, '0'                
    add     bx, ax
    inc     rsi
    loop    sum_loop

    
    mov     ax, bx
    xor     dx, dx
    mov     cx, 10
    div     cx                     
    push    dx                     

    
    add     al, '0'
    mov     byte [place], al
    call    print_symb

    
    pop     dx
    add     dl, '0'
    mov     byte [place], dl
    call    print_symb

    
    mov     al, 0xA
    mov     byte [place], al
    call    print_symb

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