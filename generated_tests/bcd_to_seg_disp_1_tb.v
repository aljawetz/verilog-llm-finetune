`timescale 1ns/1ps

module tb_bcd_to_seg_disp;

reg in0, in1, in2, in3;
wire a, b, c, d, e, f, g, dp;

// Instantiate the module under test (uut)
bcd_to_seg_disp uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .dp(dp)
);

initial begin
    // Test all BCD inputs from 0 to 9
    {in3, in2, in1, in0} = 4'b0000; // 0
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11111100) $display("FAIL: Test for input 0 failed");

    {in3, in2, in1, in0} = 4'b0001; // 1
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b01100000) $display("FAIL: Test for input 1 failed");

    {in3, in2, in1, in0} = 4'b0010; // 2
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11011010) $display("FAIL: Test for input 2 failed");

    {in3, in2, in1, in0} = 4'b0011; // 3
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11110010) $display("FAIL: Test for input 3 failed");

    {in3, in2, in1, in0} = 4'b0100; // 4
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b01100110) $display("FAIL: Test for input 4 failed");

    {in3, in2, in1, in0} = 4'b0101; // 5
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b10110110) $display("FAIL: Test for input 5 failed");

    {in3, in2, in1, in0} = 4'b0110; // 6
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b10111110) $display("FAIL: Test for input 6 failed");

    {in3, in2, in1, in0} = 4'b0111; // 7
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11100000) $display("FAIL: Test for input 7 failed");

    {in3, in2, in1, in0} = 4'b1000; // 8
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11111110) $display("FAIL: Test for input 8 failed");

    {in3, in2, in1, in0} = 4'b1001; // 9
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b11110110) $display("FAIL: Test for input 9 failed");

    // Test for invalid BCD input (10)
    {in3, in2, in1, in0} = 4'b1010; // 10 (invalid)
    #10;
    if ({a, b, c, d, e, f, g, dp} !== 8'b00000000) $display("FAIL: Test for invalid input 10 failed");

    $display("PASS");
    $finish;
end

endmodule