section     .text
global      _start 

_start: 

    mov     edx,len         ;arg3 - message length
    mov     ecx,msg         ;arg2 - message to write
    mov     ebx,1           ;arg1 - file descriptor 1 (stdout)
    mov     eax,4           ;system call number 4 (write)
    int     0x80            ;make system call

    mov     eax,1           ;system call number 1 (exit)
    int     0x80            ;make system call

section     .data

msg     db  'Hello, world!',0xa     ; hello world string
len     equ $ - msg                 ; hello world string length 

