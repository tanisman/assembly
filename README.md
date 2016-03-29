# How to compile

Use nasm to generate .o files than use gcc to generate executable file

Example compiling cmd lines for insertion_sort.asm
<dl>
nasm -f elf -l insertion_sort.lst insertion_sort.asm
gcc -o insertion_sort insertion_sort.o
</dl>
