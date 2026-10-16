`timescale 1ns/1ps

module tb_BCD_ex3;

reg b1, b2, b3, b4;
wire x1, x2, x3, x4;

BCD_ex3 uut (
    .b1(b1),
    .b2(b2),
    .b3(b3),
    .b4(b4),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4)
);

initial begin
    // Test case 1: Input 0000 (0 in decimal)
    b1 = 0; b2 = 0; b3 = 0; b4 = 0; #10;
    if ({x1, x2, x3, x4} !== 4'b0001) $display("FAIL: Test case 1 failed");

    // Test case 2: Input 0001 (1 in decimal)
    b1 = 0; b2 = 0; b3 = 0; b4 = 1; #10;
    if ({x1, x2, x3, x4} !== 4'b0001) $display("FAIL: Test case 2 failed");

    // Test case 3: Input 0010 (2 in decimal)
    b1 = 0; b2 = 0; b3 = 1; b4 = 0; #10;
    if ({x1, x2, x3, x4} !== 4'b0010) $display("FAIL: Test case 3 failed");

    // Test case 4: Input 0100 (4 in decimal)
    b1 = 0; b2 = 1; b3 = 0; b4 = 0; #10;
    if ({x1, x2, x3, x4} !== 4'b0100) $display("FAIL: Test case 4 failed");

    // Test case 5: Input 1000 (8 in decimal)
    b1 = 1; b2 = 0; b3 = 0; b4 = 0; #10;
    if ({x1, x2, x3, x4} !== 4'b1000) $display("FAIL: Test case 5 failed");

    // Test case 6: Input 1001 (9 in decimal)
    b1 = 1; b2 = 0; b3 = 0; b4 = 1; #10;
    if ({x1, x2, x3, x4} !== 4'b1001) $display("FAIL: Test case 6 failed");

    // Test case 7: Input 1010 (10 in decimal)
    b1 = 1; b2 = 0; b3 = 1; b4 = 0; #10;
    if ({x1, x2, x3, x4} !== 4'bxxxx) $display("FAIL: Test case 7 failed");

    // Test case 8: Input 1111 (15 in decimal)
    b1 = 1; b2 = 1; b3 = 1; b4 = 1; #10;
    if ({x1, x2, x3, x4} !== 4'bxxxx) $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
end

endmodule