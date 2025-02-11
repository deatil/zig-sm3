const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("zig-sm3", .{
        .root_source_file = b.path("./src/sm3.zig"),
    });

    // -Dtest-filter="..."
    const test_filter = b.option([]const []const u8, "test-filter", "Filter for tests to run");

    // zig build unit_test
    const unit_tests = b.addTest(.{
        .root_source_file = b.path("./src/sm3.zig"),
    });
    if (test_filter) |t| unit_tests.filters = t;

    // zig build [install]
    b.installArtifact(unit_tests);

    // zig build -Dtest-filter="..." run_unit_test
    const run_unit_tests = b.addRunArtifact(unit_tests);
    const unit_test_step = b.step("unit_test", "Run unit tests");
    unit_test_step.dependOn(&run_unit_tests.step);
}
