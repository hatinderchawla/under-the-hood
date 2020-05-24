nasm -f elf64 -o hello32.o hello32.asm
ld -s -o hello32 hello32.o

nasm -f elf64 -o hello64.o hello64.asm
ld -s -o hello64 hello64.o

gcc -o hello_c hello.c
