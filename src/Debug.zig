const script = @import("Script.zig");

pub fn disassembleChunk(chunk: *script.chunk.Chunk, chunk_name: []const u8) !void {
    try script.log.printLog("Disassembling \"{s}\" code chunk\n", .{chunk_name});

    var offset: usize = 0;
    while (offset < chunk.count) : (offset += 1) {
        try disassembleInstruction(chunk, offset);
    }
}

pub fn disassembleInstruction(chunk: *script.chunk.Chunk, offset: usize) !void {
    try script.log.printLog("Offset: {}, Instruction: {s}\n", .{
        offset,
        @tagName(@intToEnum(script.opcodes, chunk.code.items[offset]))
        });
}