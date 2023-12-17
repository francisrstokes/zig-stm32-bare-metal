const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .os_tag = .freestanding,
        .abi = .eabihf,
    };

    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseSmall,
    });

    const elf = b.addExecutable(.{
        .name = "zig-stm32.elf",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    elf.setLinkerScript(.{ .path = "src/linker.ld" });

    const vector_obj = b.addObject(.{
        .name = "vector",
        .root_source_file = .{ .path = "src/vector.zig" },
        .target = target,
        .optimize = optimize,
    });

    elf.addObject(vector_obj);

    b.default_step.dependOn(&elf.step);
    b.installArtifact(elf);
}
