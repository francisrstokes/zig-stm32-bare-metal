ZIG=zig
OBJCOPY=arm-none-eabi-objcopy
RM=rm -f

.PHONY: all clean

ZIG_BUILD_DIR=zig-out/bin

all: elf bin
elf: $(ZIG_BUILD_DIR)/zig-stm32.elf
bin: $(ZIG_BUILD_DIR)/zig-stm32.bin

%.elf: Makefile build.zig src/*.zig
	$(ZIG) build

%.bin: Makefile build.zig %.elf
	$(OBJCOPY) -Obinary $(*).elf $(*).bin

clean:
	$(RM) -r zig-out/bin
