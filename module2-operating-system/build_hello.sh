nasm -f elf64 -o hello32.o hello32.asm
ld -s -o hello32 hello32.o

nasm -f elf64 -o hello64.o hello64.asm
ld -s -o hello64 hello64.o

gcc -o hello_c hello.c
gcc -o exec_program exec_program.c
gcc -o just_fork just_fork.c
gcc -o fork_process fork_process.c
