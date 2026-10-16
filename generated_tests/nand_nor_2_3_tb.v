`timescale 1ns/1ps

module tb_nand_nor_2;

  reg [3:0] in;
  wire out;

  // Instantiate the module under test (uut)
  nand_nor_2 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: in = 4'b0000
    in = 4'b0000; #10;
    if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

    // Test case 2: in = 4'b0001
    in = 4'b0001; #10;
    if (out !== 1'b1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

    // Test case 3: in = 4'b0010
    in = 4'b0010; #10;
    if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

    // Test case 4: in = 4'b0011
    in = 4'b0011; #10;
    if (out !== 1'b0) $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);

    // Test case 5: in = 4'b0100
    in = 4'b0100; #10;
    if (out !== 1'b1) $display("FAIL: Test case 5 failed, expected out = 1, got out = %b", out);

    // Test case 6: in = 4'b0101
    in = 4'b0101; #10;
    if (out !== 1'b0) $display("FAIL: Test case 6 failed, expected out = 0, got out = %b", out);

    // Test case 7: in = 4'b0110
    in = 4'b0110; #10;
    if (out !== 1'b0) $display("FAIL: Test case 7 failed, expected out = 0, got out = %b", out);

    // Test case 8: in = 4'b0111
    in = 4'b0111; #10;
    if (out !== 1'b0) $display("FAIL: Test case 8 failed, expected out = 0, got out = %b", out);

    // Test case 9: in = 4'b1000
    in = 4'b1000; #10;
    if (out !== 1'b1) $display("FAIL: Test case 9 failed, expected out = 1, got out = %b", out);

    // Test case 10: in = 4'b1001
    in = 4'b1001; #10;
    if (out !== 1'b0) $display("FAIL: Test case 10 failed, expected out = 0, got out = %b", out);

    // Test case 11: in = 4'b1010
    in = 4'b1010; #10;
    if (out !== 1'b0) $display("FAIL: Test case 11 failed, expected out = 0, got out = %b", out);

    // Test case 12: in = 4'b1011
    in = 4'b1011; #10;
    if (out !== 1'b0) $display("FAIL: Test case 12 failed, expected out = 0, got out = %b", out);

    // Test case 13: in = 4'b1100
    in = 4'b1100; #10;
    if (out !== 1'b0) $display("FAIL: Test case 13 failed, expected out = 0, got out = %b", out);

    // Test case 14: in = 4'b1101
    in = 4'b1101; #10;
    if (out !== 1'b0) $display("FAIL: Test case 14 failed, expected out = 0, got out = %b", out);

    // Test case 15: in = 4'b1110
    in = 4'b1110; #10;
    if (out !== 1'b0) $display("FAIL: Test case 15 failed, expected out = 0, got out = %b", out);

    // Test case 16: in = 4'b1111
    in = 4'b1111; #10;
    if (out !== 1'b0) $display("FAIL: Test case 16 failed, expected out = 0, got out = %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule