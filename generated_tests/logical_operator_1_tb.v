`timescale 1ns/1ps

module tb_logical_operator;

reg [2:0] a, b, c, d, e, f;
wire y;

// Instantiate the module under test
logical_operator uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .y(y)
);

initial begin
    // Test case 1: a < b, c == d, e <= f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b000; e = 3'b000; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1 but got y=%b", y);

    // Test case 2: a < b, c != d, e <= f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b001; e = 3'b000; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1 but got y=%b", y);

    // Test case 3: a < b, c == d, e > f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b000; e = 3'b010; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1 but got y=%b", y);

    // Test case 4: a >= b
    a = 3'b010; b = 3'b010; c = 3'b000; d = 3'b000; e = 3'b000; f = 3'b001;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed, expected y=0 but got y=%b", y);

    // Test case 5: a < b, c == d, e > f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b000; e = 3'b010; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y=1 but got y=%b", y);

    // Test case 6: a < b, c != d, e > f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b001; e = 3'b010; f = 3'b001;
    #10;
    if (y !== 0) $display("FAIL: Test case 6 failed, expected y=0 but got y=%b", y);

    // Test case 7: a < b, c == d, e == f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b000; e = 3'b001; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 7 failed, expected y=1 but got y=%b", y);

    // Test case 8: a < b, c != d, e == f
    a = 3'b001; b = 3'b010; c = 3'b000; d = 3'b001; e = 3'b001; f = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 8 failed, expected y=1 but got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule