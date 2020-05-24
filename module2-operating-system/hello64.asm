section     .text
global      _start 

_start: 

    mov     rdx,len    ;arg3 - message length
    mov     rsi,msg    ;arg2 - message to write
    mov     rdi,1      ;arg1 - file descriptor 1 (stdout)
    mov     rax,1      ;system call number 1 (write)
    syscall            ;make system call

    mov     rdi,0      ;arg1 - exit code
    mov     rax,60     ;system call number 60 (exit)
    syscall            ;make system call

section     .data

msg     db  'Hello, world!',0xa    ; hello world message string
len     equ $ - msg     ; hello world string length

