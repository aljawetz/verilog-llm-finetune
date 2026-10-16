`timescale 1ns/1ps

module tb_comp3;

reg a0, a1, a2;
reg b0, b1, b2;
wire l, e, g;

// Instantiate the module under test
comp3 uut (
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .b0(b0),
    .b1(b1),
    .b2(b2),
    .l(l),
    .e(e),
    .g(g)
);

initial begin
    // Test case 1: a < b
    a0 = 0; a1 = 0; a2 = 0; // a = 0
    b0 = 0; b1 = 0; b2 = 1; // b = 1
    #10;
    if (l !== 1 || e !== 0 || g !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a > b
    a0 = 1; a1 = 0; a2 = 0; // a = 4
    b0 = 0; b1 = 0; b2 = 1; // b = 1
    #10;
    if (l !== 0 || e !== 0 || g !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a == b
    a0 = 1; a1 = 0; a2 = 1; // a = 5
    b0 = 1; b1 = 0; b2 = 1; // b = 5
    #10;
    if (l !== 0 || e !== 1 || g !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a < b (different bits)
    a0 = 0; a1 = 1; a2 = 0; // a = 2
    b0 = 1; b1 = 0; b2 = 0; // b = 4
    #10;
    if (l !== 1 || e !== 0 || g !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: a > b (different bits)
    a0 = 1; a1 = 1; a2 = 0; // a = 6
    b0 = 0; b1 = 1; b2 = 1; // b = 3
    #10;
    if (l !== 0 || e !== 0 || g !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: a == b (all bits same)
    a0 = 1; a1 = 1; a2 = 1; // a = 7
    b0 = 1; b1 = 1; b2 = 1; // b = 7
    #10;
    if (l !== 0 || e !== 1 || g !== 0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule