const script = @import("Script.zig");

pub const ValueArray = struct {
    capacity: usize,
    count: usize,
    values: script.std.ArrayList(f64),
};