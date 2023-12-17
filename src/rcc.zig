const rcc_base_address: u32 = 0x40023800;

const AHB1ENR_s = packed struct {
    GPIOAEN: u1 = 0,
    GPIOBEN: u1 = 0,
    GPIOCEN: u1 = 0,
    GPIODEN: u1 = 0,
    GPIOEEN: u1 = 0,
    reserved3: u2 = 0,
    GPIOHEN: u1 = 0,
    reserved2: u4 = 0,
    ECRCEN: u1 = 0,
    reserved1: u8 = 0,
    DMA1EN: u1 = 0,
    DMA2EN: u1 = 0,
    reserved0: u9 = 0,
};
pub const AHB1ENR: *AHB1ENR_s = @ptrFromInt(rcc_base_address + 0x30);
