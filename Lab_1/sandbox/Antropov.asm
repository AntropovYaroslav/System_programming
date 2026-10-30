format ELF executable 3
entry _start

msg db "Antropov", 0xA
    db "Yaroslav", 0xA
    db "Eduardovich", 0xA
msg_len = $ - msg

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
