pub const std = @import("std");

// Files
pub const chunk = @import("Chunk.zig");
pub const opcodes = @import("OpCode.zig").OpCodes;
pub const log = @import("Log.zig");
pub const debug = @import("Debug.zig");

// Set the namespaced global vars
// TODO: Implement logging to file
pub const Config = struct {
    pub var logging: bool = true;
};

// Errors

// Tests

test "initChunk" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var code_chunk = chunk.initChunk(gpa.allocator());

    chunk.writeChunk(&code_chunk, @enumToInt(opcodes.op_return)) catch {
        std.log.err("failed to write to code chunk!", .{});
        return;
    };

    // Need to append a newline, otherwise zig test eats the output
    try log.printLog("Wrote to chunk\n", .{});

    try debug.disassembleChunk(&code_chunk, "test");

    code_chunk.code.deinit();
}