`timescale 1ns/1ps

module tb_two_bit_comp;

reg a0, a1, b0, b1;
wire G, L, E;

// Instantiate the two_bit_comp module
two_bit_comp uut (
    .G(G),
    .L(L),
    .E(E),
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1)
);

initial begin
    // Test case 1: a = 00, b = 00 (Equal)
    a0 = 0; a1 = 0; b0 = 0; b1 = 0;
    #10;
    if (G !== 0 || L !== 0 || E !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 01, b = 00 (Greater)
    a0 = 1; a1 = 0; b0 = 0; b1 = 0;
    #10;
    if (G !== 1 || L !== 0 || E !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 00, b = 01 (Less)
    a0 = 0; a1 = 0; b0 = 1; b1 = 0;
    #10;
    if (G !== 0 || L !== 1 || E !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 10, b = 01 (Greater)
    a0 = 0; a1 = 1; b0 = 1; b1 = 0;
    #10;
    if (G !== 1 || L !== 0 || E !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: a = 01, b = 10 (Less)
    a0 = 1; a1 = 0; b0 = 0; b1 = 1;
    #10;
    if (G !== 0 || L !== 1 || E !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a = 11, b = 11 (Equal)
    a0 = 1; a1 = 1; b0 = 1; b1 = 1;
    #10;
    if (G !== 0 || L !== 0 || E !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: a = 10, b = 10 (Equal)
    a0 = 0; a1 = 1; b0 = 0; b1 = 1;
    #10;
    if (G !== 0 || L !== 0 || E !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a = 11, b = 10 (Greater)
    a0 = 1; a1 = 1; b0 = 0; b1 = 1;
    #10;
    if (G !== 1 || L !== 0 || E !== 0) $display("FAIL: Test case 8 failed");

    // Test case 9: a = 10, b = 11 (Less)
    a0 = 0; a1 = 1; b0 = 1; b1 = 1;
    #10;
    if (G !== 0 || L !== 1 || E !== 0) $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule