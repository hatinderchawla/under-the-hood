section     .text
global      _start          

_start:                     
    mov     rdi,1000000000
    call    _func_loop      ;function call result will be available in rax

    mov     rdi,0           ;load argument 1 for exit code=0 in rdi
    mov     rax,60          ;load system call number (sys_exit) in rax
    syscall                 ;make kernel system call

_func_loop:
    mov     rcx, rdi
_loop:
    dec     rcx
    cmp     rcx, 1000
    jnz     _loop
    ret


