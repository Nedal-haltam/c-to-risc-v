


run:
	riscv-none-elf-gcc -T link.ld -nostartfiles -o main.elf main.c
# riscv-none-elf-gcc -O0 -o .\main.S -S .\main.c
# riscv-none-elf-gcc -O0 -march=rv32ima -mabi=ilp32 -o main.elf main.S	
	qemu-system-riscv32 -nographic -machine virt -cpu rv32 -bios none -kernel main.elf

asm: main.c main.S main.o
	riscv-none-elf-gcc -O0 -o .\main.S -S .\main.c
	riscv-none-elf-gcc -Wall -Werror -g -Wcast-align -ffreestanding  -fno-pic -O2  -march=rv32ima -mabi=ilp32 -c -o main.o main.S	
	riscv-none-elf-gcc -Wall -Werror -g -Wcast-align -ffreestanding  -fno-pic -O2  -nostdlib -W -T vanilla.ld -march=rv32ima -mabi=ilp32 -o main main.o -lc -lgcc
	riscv32-unknown-elf-objdump -Mnumeric no-aliases -dr main > main.lst
	qemu-system-riscv32 -machine virt -m 128M -bios none -device loader file=./main -nographic -s


