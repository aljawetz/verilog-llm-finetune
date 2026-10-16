`timescale 1ns/1ps

module tb_mux4to1;

reg a, b, c, d;
reg [1:0] s;
wire y;

// Instantiate the module under test (uut)
mux4to1 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s(s),
    .y(y)
);

initial begin
    // Test case 1: Select input a
    a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; s = 2'b00;
    #10;
    if (y !== a) $display("FAIL: Test case 1 failed, expected y=%b, got y=%b", a, y);

    // Test case 2: Select input b
    a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; s = 2'b01;
    #10;
    if (y !== b) $display("FAIL: Test case 2 failed, expected y=%b, got y=%b", b, y);

    // Test case 3: Select input c
    a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; s = 2'b10;
    #10;
    if (y !== c) $display("FAIL: Test case 3 failed, expected y=%b, got y=%b", c, y);

    // Test case 4: Select input d
    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; s = 2'b11;
    #10;
    if (y !== d) $display("FAIL: Test case 4 failed, expected y=%b, got y=%b", d, y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule