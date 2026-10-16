`timescale 1ns/1ps

module tb_bcd_segment7;

reg A, B, C, D, en;
wire [6:0] seg7;

// Instantiate the module under test (uut)
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
    // Test case 1: Enable and input 0
    en = 1; A = 0; B = 0; C = 0; D = 0; #10;
    if (seg7 !== 7'b1111110) $display("FAIL: Expected 0 for input 0, got %b", seg7);

    // Test case 2: Enable and input 1
    A = 0; B = 0; C = 0; D = 1; #10;
    if (seg7 !== 7'b0110000) $display("FAIL: Expected 1 for input 1, got %b", seg7);

    // Test case 3: Enable and input 2
    A = 0; B = 0; C = 1; D = 0; #10;
    if (seg7 !== 7'b1101101) $display("FAIL: Expected 2 for input 2, got %b", seg7);

    // Test case 4: Enable and input 3
    A = 0; B = 0; C = 1; D = 1; #10;
    if (seg7 !== 7'b1111001) $display("FAIL: Expected 3 for input 3, got %b", seg7);

    // Test case 5: Enable and input 4
    A = 0; B = 1; C = 0; D = 0; #10;
    if (seg7 !== 7'b0110011) $display("FAIL: Expected 4 for input 4, got %b", seg7);

    // Test case 6: Enable and input 5
    A = 0; B = 1; C = 0; D = 1; #10;
    if (seg7 !== 7'b1011011) $display("FAIL: Expected 5 for input 5, got %b", seg7);

    // Test case 7: Enable and input 6
    A = 0; B = 1; C = 1; D = 0; #10;
    if (seg7 !== 7'b1011111) $display("FAIL: Expected 6 for input 6, got %b", seg7);

    // Test case 8: Enable and input 7
    A = 0; B = 1; C = 1; D = 1; #10;
    if (seg7 !== 7'b1110000) $display("FAIL: Expected 7 for input 7, got %b", seg7);

    // Test case 9: Enable and input 8
    A = 1; B = 0; C = 0; D = 0; #10;
    if (seg7 !== 7'b1111111) $display("FAIL: Expected 8 for input 8, got %b", seg7);

    // Test case 10: Enable and input 9
    A = 1; B = 0; C = 0; D = 1; #10;
    if (seg7 !== 7'b1111011) $display("FAIL: Expected 9 for input 9, got %b", seg7);

    // Test case 11: Enable and input 10 (invalid BCD)
    A = 1; B = 0; C = 1; D = 0; #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Expected 0 for input 10, got %b", seg7);

    // Test case 12: Disable the output
    en = 0; #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Expected 0 when disabled, got %b", seg7);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule