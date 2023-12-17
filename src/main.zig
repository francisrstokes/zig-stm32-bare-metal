const std = @import("std");
const rcc = @import("rcc.zig");
const gpio = @import("gpio.zig");

extern const _data_loadaddr: u32;
extern var _data: u32;
extern const _edata: u32;
extern var _bss: u32;
extern const _ebss: u32;

export fn resetHandler() void {
    // Copy data from flash to RAM
    const data_loadaddr: [*]const u8 = @ptrCast(&_data_loadaddr);
    const data = @as([*]u8, @ptrCast(&_data));
    const data_size = @intFromPtr(&_edata) - @intFromPtr(&_data);
    for (data_loadaddr[0..data_size], 0..) |d, i| data[i] = d;

    // Clear the bss
    const bss: [*]u8 = @ptrCast(&_bss);
    const bss_size = @intFromPtr(&_ebss) - @intFromPtr(&_bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    main();
    unreachable;
}

fn delay_loop(iterations: usize) void {
    var i: usize = 0;
    var iptr: *volatile usize = &i;

    while (iptr.* < iterations) {
        iptr.* += 1;
    }
}

pub fn main() void {
    rcc.AHB1ENR.GPIOAEN = 1;

    gpio.PortA.MODER.MODE5 = 1;
    gpio.PortA.OTYPER.OT5 = 0;
    gpio.PortA.OSPEEDR.OSPEEDR5 = 0;
    gpio.PortA.ODR.ODR5 = 1;

    while (true) {
        delay_loop(100000);
        gpio.PortA.ODR.ODR5 ^= 1;
    }
}
