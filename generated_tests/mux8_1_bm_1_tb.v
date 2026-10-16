`timescale 1ns/1ps

module tb_mux8_1_bm;

reg i0, i1, i2, i3, i4, i5, i6, i7;
reg s2, s1, s0;
wire y;

// Instantiate the module under test (uut)
mux8_1_bm uut (
    .i0(i0), 
    .i1(i1), 
    .i2(i2), 
    .i3(i3), 
    .i4(i4), 
    .i5(i5), 
    .i6(i6), 
    .i7(i7), 
    .s2(s2), 
    .s1(s1), 
    .s0(s0), 
    .y(y)
);

initial begin
    // Test case 1: Select input i0
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    s2 = 0; s1 = 0; s0 = 0; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 000, got y=%b", y);

    // Test case 2: Select input i1
    s2 = 0; s1 = 0; s0 = 1; #10;
    if (y !== 0) $display("FAIL: Expected y=0 for selection 001, got y=%b", y);

    // Test case 3: Select input i2
    i1 = 1; s2 = 0; s1 = 1; s0 = 0; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 010, got y=%b", y);

    // Test case 4: Select input i3
    i2 = 1; s2 = 0; s1 = 1; s0 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 011, got y=%b", y);

    // Test case 5: Select input i4
    i3 = 1; s2 = 1; s1 = 0; s0 = 0; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 100, got y=%b", y);

    // Test case 6: Select input i5
    i4 = 1; s2 = 1; s1 = 0; s0 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 101, got y=%b", y);

    // Test case 7: Select input i6
    i5 = 1; s2 = 1; s1 = 1; s0 = 0; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 110, got y=%b", y);

    // Test case 8: Select input i7
    i6 = 1; s2 = 1; s1 = 1; s0 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for selection 111, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule