CC      = riscv64-unknown-elf-gcc
CFLAGS  = -march=rv64gc -mabi=lp64 -mcmodel=medany -nostartfiles -Tlink.ld
OBJDUMP = riscv64-unknown-elf-objdump
ELF2HEX = riscv64-unknown-elf-elf2hex
SRCS    = $(wildcard *.S)
PROGS 	= $(patsubst %.S,%,$(SRCS))

all:		$(PROGS)

%:		%.S	
		$(CC) $(CFLAGS) -o $@.elf $<
		$(OBJDUMP) -Dls $@.elf > $@.objdump
		$(ELF2HEX) --bit-width 64 --input $@.elf --output $@.memfile

clean: 
		rm -f *.elf
		rm -f *.objdump
		rm -f *.memfile
		rm -f *~
