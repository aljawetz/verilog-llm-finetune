`timescale 1ns/1ps

module tb_Encoder_BCD;

reg [9:0] Y;
wire [3:0] A;

// Instantiate the module under test
Encoder_BCD uut (
    .Y(Y),
    .A(A)
);

initial begin
    // Test case 1: Input 0000000001 (Decimal 0)
    Y = 10'b0000000001; #10;
    if (A !== 4'b0000) $display("FAIL: Expected A = 0000, got A = %b", A);

    // Test case 2: Input 0000000010 (Decimal 1)
    Y = 10'b0000000010; #10;
    if (A !== 4'b0001) $display("FAIL: Expected A = 0001, got A = %b", A);

    // Test case 3: Input 0000000100 (Decimal 2)
    Y = 10'b0000000100; #10;
    if (A !== 4'b0010) $display("FAIL: Expected A = 0010, got A = %b", A);

    // Test case 4: Input 0000001000 (Decimal 3)
    Y = 10'b0000001000; #10;
    if (A !== 4'b0011) $display("FAIL: Expected A = 0011, got A = %b", A);

    // Test case 5: Input 0000010000 (Decimal 4)
    Y = 10'b0000010000; #10;
    if (A !== 4'b0100) $display("FAIL: Expected A = 0100, got A = %b", A);

    // Test case 6: Input 0000100000 (Decimal 5)
    Y = 10'b0000100000; #10;
    if (A !== 4'b0101) $display("FAIL: Expected A = 0101, got A = %b", A);

    // Test case 7: Input 0001000000 (Decimal 6)
    Y = 10'b0001000000; #10;
    if (A !== 4'b0110) $display("FAIL: Expected A = 0110, got A = %b", A);

    // Test case 8: Input 0010000000 (Decimal 7)
    Y = 10'b0010000000; #10;
    if (A !== 4'b0111) $display("FAIL: Expected A = 0111, got A = %b", A);

    // Test case 9: Input 0100000000 (Decimal 8)
    Y = 10'b0100000000; #10;
    if (A !== 4'b1000) $display("FAIL: Expected A = 1000, got A = %b", A);

    // Test case 10: Input 1000000000 (Decimal 9)
    Y = 10'b1000000000; #10;
    if (A !== 4'b1001) $display("FAIL: Expected A = 1001, got A = %b", A);

    // Test case 11: Invalid input (should not happen in one-hot)
    Y = 10'b0000000000; #10;
    if (A !== 4'bxxxx) $display("FAIL: Expected A = xxxx for invalid input, got A = %b", A);

    $display("PASS");
    $finish;
end

endmodule