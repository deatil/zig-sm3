## Zig-SM3 

zig-sm3 is a SM3 hash function for Zig.


### Env

 - Zig >= 0.13


### Adding zig-sm3 as a dependency

Add the dependency to your project:

```sh
zig fetch --save=zig-sm3 git+https://github.com/deatil/zig-sm3#main
```

And the following to your `build.zig` file:

```zig
    const zig_sm3 = b.dependency("zig-sm3", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("zig-sm3", zig_sm3.module("zig-sm3"));
    exe.linkLibrary(zig_sm3.artifact("zig-sm3"));
```

The `zig-sm3` structure can be imported in your application with:

```zig
const zig_sm3 = @import("zig-sm3");
```


### Get Starting

~~~zig
const std = @import("std");
const SM3 = @import("zig-sm3").SM3;

pub fn main() !void {
    var out: [32]u8 = undefined;
    
    h = SM3.init(.{});
    h.update("abc");
    h.final(out[0..]);
    
    // output: 66c7f0f462eeedd9d1f2d46bdc10e4e24167c4875cf2f7a2297da02b8f4ba8e0
    std.debug.print("output: {s}\n", .{out});
}
~~~


### LICENSE

*  The library LICENSE is `Apache2`, using the library need keep the LICENSE.


### Copyright

*  Copyright deatil(https://github.com/deatil).
