`timescale 1ns/1ps

module tb_gray2binary;

  reg [3:0] gray;
  wire [3:0] binary;

  // Instantiate the module under test (uut)
  gray2binary uut (
    .binary(binary),
    .gray(gray)
  );

  initial begin
    // Test cases
    // Gray code: 0000 -> Binary: 0000
    gray = 4'b0000; #10;
    if (binary !== 4'b0000) $display("FAIL: Expected 0000 for Gray 0000, got %b", binary);

    // Gray code: 0001 -> Binary: 0001
    gray = 4'b0001; #10;
    if (binary !== 4'b0001) $display("FAIL: Expected 0001 for Gray 0001, got %b", binary);

    // Gray code: 0011 -> Binary: 0010
    gray = 4'b0011; #10;
    if (binary !== 4'b0010) $display("FAIL: Expected 0010 for Gray 0011, got %b", binary);

    // Gray code: 0111 -> Binary: 0011
    gray = 4'b0111; #10;
    if (binary !== 4'b0011) $display("FAIL: Expected 0011 for Gray 0111, got %b", binary);

    // Gray code: 1111 -> Binary: 1000
    gray = 4'b1111; #10;
    if (binary !== 4'b1000) $display("FAIL: Expected 1000 for Gray 1111, got %b", binary);

    // Gray code: 1010 -> Binary: 1101
    gray = 4'b1010; #10;
    if (binary !== 4'b1101) $display("FAIL: Expected 1101 for Gray 1010, got %b", binary);

    // Gray code: 0101 -> Binary: 0110
    gray = 4'b0101; #10;
    if (binary !== 4'b0110) $display("FAIL: Expected 0110 for Gray 0101, got %b", binary);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule