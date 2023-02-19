const script = @import("Script.zig");

pub const Chunk = struct {
    code: script.std.ArrayList(u8),
    count: usize,
};

pub fn initChunk(allocator: script.std.mem.Allocator) Chunk {
    return Chunk {
        .code = script.std.ArrayList(u8).init(allocator),
        .count = 0,
    };
}

pub fn writeChunk(chunk: *Chunk, byte: u8) !void {
    chunk.code.append(byte) catch |err| {
        script.std.log.err("failed appending byte to chunk!", .{});
        return err;
    };
    chunk.count += 1;
}

// Deinitialisation can't fail
pub fn deinitChunk(chunk: *Chunk) void {
    chunk.code.deinit();
}