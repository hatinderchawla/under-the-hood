nasm -g -f elf64 -o loop.o loop.asm
ld -g -o loop loop.o

nasm -g -f elf64 loop2.asm
ld -g -o loop2 loop2.o

nasm -g -f elf64 loop3.asm
ld -g -o loop3 loop3.o
