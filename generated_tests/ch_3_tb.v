`timescale 1ns/1ps

module tb_ch;
    reg [31:0] x;
    reg [31:0] y;
    reg [31:0] z;
    wire [31:0] o;

    // Instantiate the module under test
    ch uut (
        .x(x),
        .y(y),
        .z(z),
        .o(o)
    );

    initial begin
        // Test case 1
        x = 32'hFFFFFFFF; // All bits are 1
        y = 32'hA5A5A5A5; // Some pattern
        z = 32'h5A5A5A5A; // Some pattern
        #10;
        if (o !== y) $display("FAIL: Test case 1 failed, expected %h, got %h", y, o);

        // Test case 2
        x = 32'h00000000; // All bits are 0
        y = 32'hA5A5A5A5; // Some pattern
        z = 32'h5A5A5A5A; // Some pattern
        #10;
        if (o !== z) $display("FAIL: Test case 2 failed, expected %h, got %h", z, o);

        // Test case 3
        x = 32'hF0F0F0F0; // Mixed bits
        y = 32'hA5A5A5A5; // Some pattern
        z = 32'h5A5A5A5A; // Some pattern
        #10;
        if (o !== (y & x) | (z & ~x)) $display("FAIL: Test case 3 failed, expected %h, got %h", (y & x) | (z & ~x), o);

        // Test case 4
        x = 32'hAAAAAAAA; // Alternating bits
        y = 32'hFFFFFFFF; // All bits are 1
        z = 32'h00000000; // All bits are 0
        #10;
        if (o !== (y & x) | (z & ~x)) $display("FAIL: Test case 4 failed, expected %h, got %h", (y & x) | (z & ~x), o);

        // Test case 5
        x = 32'h55555555; // Alternating bits
        y = 32'h12345678; // Some pattern
        z = 32'h87654321; // Some pattern
        #10;
        if (o !== (y & x) | (z & ~x)) $display("FAIL: Test case 5 failed, expected %h, got %h", (y & x) | (z & ~x), o);

        $display("PASS");
        $finish;
    end
endmodule