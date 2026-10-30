const std = @import("std");
const expect = std.testing.expect;

fn isSorted(arr: []const i32) bool {
    if (arr.len < 2) {
        return true;
    }

    for (arr[0 .. arr.len - 1], arr[1..]) |a, b| {
        if (a > b) return false;
    }
    return true;
}

fn insertionSort(arr: []i32) void {
    for (0..arr.len) |i| {
        for (i..arr.len) |j| {
            if (arr[j] < arr[i]) {
                const tmp = arr[j];
                arr[j] = arr[i];
                arr[i] = tmp;
            }
        }
    }
}

test "empty array" {
    var empty_array = [_]i32{};
    insertionSort(&empty_array);
    try expect(isSorted(&empty_array));
    try std.testing.expectEqualSlices(i32, &.{}, &empty_array);
}

test "array with single element" {
    var array: [1]i32 = .{42};
    insertionSort(&array);
    try expect(isSorted(&array));
    try std.testing.expectEqualSlices(i32, &.{42}, &array);
}

test "pre-sorted array" {
    var array = [_]i32{ 0, 2, 4, 6, 99 };
    try expect(isSorted(&array));
    insertionSort(&array);
    try expect(isSorted(&array));
    try std.testing.expectEqualSlices(i32, &.{ 0, 2, 4, 6, 99 }, &array);
}

test "regular case 01" {
    var array = [_]i32{ -4, 6, 2, 1, 3, -3 };
    insertionSort(&array);
    try expect(isSorted(&array));
    try std.testing.expectEqualSlices(i32, &.{ -4, -3, 1, 2, 3, 6 }, &array);
}

test "regular case 02" {
    var array = [_]i32{ -6, -5, -5, -4, -2, -98 };
    insertionSort(&array);
    try expect(isSorted(&array));
    try std.testing.expectEqualSlices(i32, &.{ -98, -6, -5, -5, -4, -2 }, &array);
}
