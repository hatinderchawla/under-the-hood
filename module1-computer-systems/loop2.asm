section     .text
global      _start 

_start: 
    mov     rdi,LOOP_UPPER_SIZE
    call    _func_loop      ;function call result will be available in rax

    mov     byte [exit_code],0 ; load 0 to exit_code variable
    mov     rdi, exit_code   ;load exit code to arg 1 for sys call exit
    mov     rax,60           ;load system call number (sys_exit) into rax
    syscall                  ;make kernel system call

_func_loop:
    mov     rcx, rdi
_loop:
    dec     rcx
    cmp     rcx, LOOP_LOWER_SIZE
    jnz     _loop
    ret

LOOP_UPPER_SIZE equ 1000000000
LOOP_LOWER_SIZE equ 1000

section .data
exit_code db -1
