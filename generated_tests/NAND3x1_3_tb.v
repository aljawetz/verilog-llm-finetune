`timescale 1ns/1ps

module tb_NAND3x1;

reg A;
reg B;
reg C;
wire Y;

// Instantiate the module under test (uut)
NAND3x1 uut (
    .Y(Y),
    .A(A),
    .B(B),
    .C(C)
);

initial begin
    // Test all combinations of A, B, and C
    // A B C | Y
    // 0 0 0 | 1
    // 0 0 1 | 1
    // 0 1 0 | 1
    // 0 1 1 | 1
    // 1 0 0 | 1
    // 1 0 1 | 1
    // 1 1 0 | 1
    // 1 1 1 | 0

    // Test case 1: A=0, B=0, C=0
    A = 0; B = 0; C = 0; #10;
    if (Y !== 1) $display("FAIL: Test case A=0, B=0, C=0 failed");

    // Test case 2: A=0, B=0, C=1
    A = 0; B = 0; C = 1; #10;
    if (Y !== 1) $display("FAIL: Test case A=0, B=0, C=1 failed");

    // Test case 3: A=0, B=1, C=0
    A = 0; B = 1; C = 0; #10;
    if (Y !== 1) $display("FAIL: Test case A=0, B=1, C=0 failed");

    // Test case 4: A=0, B=1, C=1
    A = 0; B = 1; C = 1; #10;
    if (Y !== 1) $display("FAIL: Test case A=0, B=1, C=1 failed");

    // Test case 5: A=1, B=0, C=0
    A = 1; B = 0; C = 0; #10;
    if (Y !== 1) $display("FAIL: Test case A=1, B=0, C=0 failed");

    // Test case 6: A=1, B=0, C=1
    A = 1; B = 0; C = 1; #10;
    if (Y !== 1) $display("FAIL: Test case A=1, B=0, C=1 failed");

    // Test case 7: A=1, B=1, C=0
    A = 1; B = 1; C = 0; #10;
    if (Y !== 1) $display("FAIL: Test case A=1, B=1, C=0 failed");

    // Test case 8: A=1, B=1, C=1
    A = 1; B = 1; C = 1; #10;
    if (Y !== 0) $display("FAIL: Test case A=1, B=1, C=1 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule