section     .text
global      _start 

_start: 
    mov     rdi,LOOP_UPPER_SIZE
    call    _func_loop      ;function call result will be available in rax

    mov     byte [exit_code],0
    mov     rdi, exit_code   ;exit code 0
    mov     rax,60           ;system call number (sys_exit)
    syscall                  ;call kernel

_func_loop:
;    mov     rcx, rdi
    mov     [value], rdi
_loop:
    dec     qword [value]
    cmp     qword [value], LOOP_LOWER_SIZE
    jnz     _loop
    ret

LOOP_UPPER_SIZE equ 1000000000
LOOP_LOWER_SIZE equ 1000

section .data
exit_code db -1
value     dq  0
