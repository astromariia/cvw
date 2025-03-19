TARGET = pr12

COMMON_DIR = common

CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump

CFLAGS = -march=rv64gc -mabi=lp64d -mcmodel=medany \
         -nostdlib -static -O -g \
         -T$(COMMON_DIR)/test.ld -I$(COMMON_DIR) \
         -fno-tree-loop-distribute-patterns

SRCS = $(TARGET).c $(COMMON_DIR)/crt.S $(COMMON_DIR)/syscalls.c

all: $(TARGET).elf $(TARGET).objdump

$(TARGET).elf: $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^ -lm

$(TARGET).objdump: $(TARGET).elf
	$(OBJDUMP) -D $< > $@

clean:
	rm -f $(TARGET).elf $(TARGET).objdump *.o *~

.PHONY: all clean