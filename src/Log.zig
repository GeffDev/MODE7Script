const script = @import("Script.zig");

const stdout = script.std.io.getStdOut().writer();

pub fn printLog(comptime format: []const u8, args: anytype) !void {
    try stdout.print(format, args);
}