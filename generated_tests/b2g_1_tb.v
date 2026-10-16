`timescale 1ns/1ps

module tb_b2g;

  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  b2g uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test cases
    // Test case 0: Binary 0000 -> Gray 0000
    in = 4'b0000; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 0 failed, expected 0000, got %b", out);

    // Test case 1: Binary 0001 -> Gray 0001
    in = 4'b0001; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", out);

    // Test case 2: Binary 0010 -> Gray 0011
    in = 4'b0010; #10;
    if (out !== 4'b0011) $display("FAIL: Test case 2 failed, expected 0011, got %b", out);

    // Test case 3: Binary 0011 -> Gray 0010
    in = 4'b0011; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", out);

    // Test case 4: Binary 0100 -> Gray 0110
    in = 4'b0100; #10;
    if (out !== 4'b0110) $display("FAIL: Test case 4 failed, expected 0110, got %b", out);

    // Test case 5: Binary 0101 -> Gray 0111
    in = 4'b0101; #10;
    if (out !== 4'b0111) $display("FAIL: Test case 5 failed, expected 0111, got %b", out);

    // Test case 6: Binary 0110 -> Gray 0101
    in = 4'b0110; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 6 failed, expected 0101, got %b", out);

    // Test case 7: Binary 0111 -> Gray 0100
    in = 4'b0111; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 7 failed, expected 0100, got %b", out);

    // Test case 8: Binary 1000 -> Gray 1100
    in = 4'b1000; #10;
    if (out !== 4'b1100) $display("FAIL: Test case 8 failed, expected 1100, got %b", out);

    // Test case 9: Binary 1001 -> Gray 1101
    in = 4'b1001; #10;
    if (out !== 4'b1101) $display("FAIL: Test case 9 failed, expected 1101, got %b", out);

    // Test case 10: Binary 1010 -> Gray 1111
    in = 4'b1010; #10;
    if (out !== 4'b1111) $display("FAIL: Test case 10 failed, expected 1111, got %b", out);

    // Test case 11: Binary 1011 -> Gray 1110
    in = 4'b1011; #10;
    if (out !== 4'b1110) $display("FAIL: Test case 11 failed, expected 1110, got %b", out);

    // Test case 12: Binary 1100 -> Gray 1010
    in = 4'b1100; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 12 failed, expected 1010, got %b", out);

    // Test case 13: Binary 1101 -> Gray 1011
    in = 4'b1101; #10;
    if (out !== 4'b1011) $display("FAIL: Test case 13 failed, expected 1011, got %b", out);

    // Test case 14: Binary 1110 -> Gray 1001
    in = 4'b1110; #10;
    if (out !== 4'b1001) $display("FAIL: Test case 14 failed, expected 1001, got %b", out);

    // Test case 15: Binary 1111 -> Gray 1000
    in = 4'b1111; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 15 failed, expected 1000, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule