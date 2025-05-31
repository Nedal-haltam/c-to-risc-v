

all: build run

build: .\main.c
	riscv-none-elf-gcc -static -o .\bin\main.elf  .\main.c

bin: .\bin\main.elf
	riscv-none-elf-objcopy -O binary .\bin\main.elf .\bin\main.bin

asm: .\main.c
	riscv-none-elf-gcc -o .\bin\main.s -S .\main.c

emu: .\bin\main.elf
	qemu-system-riscv32 .\bin\main.elf

clean:
	-if exist .\bin rmdir /S /Q .\bin
	mkdir .\bin