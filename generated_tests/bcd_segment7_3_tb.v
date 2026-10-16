`timescale 1ns/1ps

module tb_bcd_segment7;

reg A, B, C, D, en;
wire [6:0] seg7;

// Instantiate the module under test
bcd_segment7 uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .en(en),
    .seg7(seg7)
);

// Test procedure
initial begin
    // Test case 1: Enable with BCD 0 (0000)
    en = 1; A = 0; B = 0; C = 0; D = 0;
    #10;
    if (seg7 !== 7'b0111111) $display("FAIL: Expected 0111111 for BCD 0, got %b", seg7);

    // Test case 2: Enable with BCD 1 (0001)
    A = 0; B = 0; C = 0; D = 1;
    #10;
    if (seg7 !== 7'b0000110) $display("FAIL: Expected 0000110 for BCD 1, got %b", seg7);

    // Test case 3: Enable with BCD 2 (0010)
    A = 0; B = 0; C = 1; D = 0;
    #10;
    if (seg7 !== 7'b1011011) $display("FAIL: Expected 1011011 for BCD 2, got %b", seg7);

    // Test case 4: Enable with BCD 3 (0011)
    A = 0; B = 0; C = 1; D = 1;
    #10;
    if (seg7 !== 7'b1001111) $display("FAIL: Expected 1001111 for BCD 3, got %b", seg7);

    // Test case 5: Enable with BCD 4 (0100)
    A = 0; B = 1; C = 0; D = 0;
    #10;
    if (seg7 !== 7'b1100110) $display("FAIL: Expected 1100110 for BCD 4, got %b", seg7);

    // Test case 6: Enable with BCD 5 (0101)
    A = 0; B = 1; C = 0; D = 1;
    #10;
    if (seg7 !== 7'b1101101) $display("FAIL: Expected 1101101 for BCD 5, got %b", seg7);

    // Test case 7: Enable with BCD 6 (0110)
    A = 0; B = 1; C = 1; D = 0;
    #10;
    if (seg7 !== 7'b1111101) $display("FAIL: Expected 1111101 for BCD 6, got %b", seg7);

    // Test case 8: Enable with BCD 7 (0111)
    A = 0; B = 1; C = 1; D = 1;
    #10;
    if (seg7 !== 7'b0000111) $display("FAIL: Expected 0000111 for BCD 7, got %b", seg7);

    // Test case 9: Enable with BCD 8 (1000)
    A = 1; B = 0; C = 0; D = 0;
    #10;
    if (seg7 !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 8, got %b", seg7);

    // Test case 10: Enable with BCD 9 (1001)
    A = 1; B = 0; C = 0; D = 1;
    #10;
    if (seg7 !== 7'b1100111) $display("FAIL: Expected 1100111 for BCD 9, got %b", seg7);

    // Test case 11: Disable (en = 0)
    en = 0;
    #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Expected 0000000 when disabled, got %b", seg7);

    // Test case 12: Invalid BCD (1010)
    en = 1; A = 1; B = 0; C = 1; D = 0; // 10 in BCD
    #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Expected 0000000 for invalid BCD 10, got %b", seg7);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule