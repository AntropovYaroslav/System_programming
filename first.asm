format ELF64 executable
entry _start

msg db "Hello, world", 0xA, 0

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 14
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall