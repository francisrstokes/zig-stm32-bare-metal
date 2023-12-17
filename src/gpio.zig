pub const PortA = GPIO.init(0x40020000);
pub const PortB = GPIO.init(0x40020400);
pub const PortC = GPIO.init(0x40020800);
pub const PortD = GPIO.init(0x40020c00);
pub const PortE = GPIO.init(0x40021000);
pub const PortH = GPIO.init(0x4002c000);

pub const GPIO = struct {
    MODER: *PortMode,
    OTYPER: *OutputType,
    OSPEEDR: *OutputSpeed,
    PUPDR: *PullupPulldown,
    IDR: *InputData,
    ODR: *OutputData,

    pub fn init(port: u32) GPIO {
        return .{
            .MODER = @ptrFromInt(port + 0x00),
            .OTYPER = @ptrFromInt(port + 0x04),
            .OSPEEDR = @ptrFromInt(port + 0x08),
            .PUPDR = @ptrFromInt(port + 0x0C),
            .IDR = @ptrFromInt(port + 0x10),
            .ODR = @ptrFromInt(port + 0x14),
        };
    }
};

const PortMode = packed struct {
    MODE0: u2 = 0,
    MODE1: u2 = 0,
    MODE2: u2 = 0,
    MODE3: u2 = 0,
    MODE4: u2 = 0,
    MODE5: u2 = 0,
    MODE6: u2 = 0,
    MODE7: u2 = 0,
    MODE8: u2 = 0,
    MODE9: u2 = 0,
    MODE10: u2 = 0,
    MODE11: u2 = 0,
    MODE12: u2 = 0,
    MODE13: u2 = 0,
    MODE14: u2 = 0,
    MODE15: u2 = 0,
};

const OutputType = packed struct {
    OT0: u1 = 0,
    OT1: u1 = 0,
    OT2: u1 = 0,
    OT3: u1 = 0,
    OT4: u1 = 0,
    OT5: u1 = 0,
    OT6: u1 = 0,
    OT7: u1 = 0,
    OT8: u1 = 0,
    OT9: u1 = 0,
    OT10: u1 = 0,
    OT11: u1 = 0,
    OT12: u1 = 0,
    OT13: u1 = 0,
    OT14: u1 = 0,
    OT15: u1 = 0,
    reserved: u16 = 0,
};

const OutputSpeed = packed struct {
    OSPEEDR0: u2 = 0,
    OSPEEDR1: u2 = 0,
    OSPEEDR2: u2 = 0,
    OSPEEDR3: u2 = 0,
    OSPEEDR4: u2 = 0,
    OSPEEDR5: u2 = 0,
    OSPEEDR6: u2 = 0,
    OSPEEDR7: u2 = 0,
    OSPEEDR8: u2 = 0,
    OSPEEDR9: u2 = 0,
    OSPEEDR10: u2 = 0,
    OSPEEDR11: u2 = 0,
    OSPEEDR12: u2 = 0,
    OSPEEDR13: u2 = 0,
    OSPEEDR14: u2 = 0,
    OSPEEDR15: u2 = 0,
};

const PullupPulldown = packed struct {
    PUPDR0: u2 = 0,
    PUPDR1: u2 = 0,
    PUPDR2: u2 = 0,
    PUPDR3: u2 = 0,
    PUPDR4: u2 = 0,
    PUPDR5: u2 = 0,
    PUPDR6: u2 = 0,
    PUPDR7: u2 = 0,
    PUPDR8: u2 = 0,
    PUPDR9: u2 = 0,
    PUPDR10: u2 = 0,
    PUPDR11: u2 = 0,
    PUPDR12: u2 = 0,
    PUPDR13: u2 = 0,
    PUPDR14: u2 = 0,
    PUPDR15: u2 = 0,
};

const InputData = packed struct {
    IDR0: u1 = 0,
    IDR1: u1 = 0,
    IDR2: u1 = 0,
    IDR3: u1 = 0,
    IDR4: u1 = 0,
    IDR5: u1 = 0,
    IDR6: u1 = 0,
    IDR7: u1 = 0,
    IDR8: u1 = 0,
    IDR9: u1 = 0,
    IDR10: u1 = 0,
    IDR11: u1 = 0,
    IDR12: u1 = 0,
    IDR13: u1 = 0,
    IDR14: u1 = 0,
    IDR15: u1 = 0,
    reserved: u16 = 0,
};

const OutputData = packed struct {
    ODR0: u1 = 0,
    ODR1: u1 = 0,
    ODR2: u1 = 0,
    ODR3: u1 = 0,
    ODR4: u1 = 0,
    ODR5: u1 = 0,
    ODR6: u1 = 0,
    ODR7: u1 = 0,
    ODR8: u1 = 0,
    ODR9: u1 = 0,
    ODR10: u1 = 0,
    ODR11: u1 = 0,
    ODR12: u1 = 0,
    ODR13: u1 = 0,
    ODR14: u1 = 0,
    ODR15: u1 = 0,
    reserved: u16 = 0,
};
