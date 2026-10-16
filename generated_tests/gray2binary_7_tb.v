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
    // Test cases for Gray to Binary conversion
    // Format: gray code -> expected binary
    gray = 4'b0000; #10;
    if (binary !== 4'b0000) $display("FAIL: gray=0000, expected binary=0000, got binary=%b", binary);

    gray = 4'b0001; #10;
    if (binary !== 4'b0001) $display("FAIL: gray=0001, expected binary=0001, got binary=%b", binary);

    gray = 4'b0011; #10;
    if (binary !== 4'b0010) $display("FAIL: gray=0011, expected binary=0010, got binary=%b", binary);

    gray = 4'b0010; #10;
    if (binary !== 4'b0011) $display("FAIL: gray=0010, expected binary=0011, got binary=%b", binary);

    gray = 4'b0110; #10;
    if (binary !== 4'b0101) $display("FAIL: gray=0110, expected binary=0101, got binary=%b", binary);

    gray = 4'b0111; #10;
    if (binary !== 4'b0110) $display("FAIL: gray=0111, expected binary=0110, got binary=%b", binary);

    gray = 4'b0101; #10;
    if (binary !== 4'b0111) $display("FAIL: gray=0101, expected binary=0111, got binary=%b", binary);

    gray = 4'b0100; #10;
    if (binary !== 4'b0100) $display("FAIL: gray=0100, expected binary=0100, got binary=%b", binary);

    gray = 4'b1100; #10;
    if (binary !== 4'b1000) $display("FAIL: gray=1100, expected binary=1000, got binary=%b", binary);

    gray = 4'b1101; #10;
    if (binary !== 4'b1001) $display("FAIL: gray=1101, expected binary=1001, got binary=%b", binary);

    gray = 4'b1111; #10;
    if (binary !== 4'b1011) $display("FAIL: gray=1111, expected binary=1011, got binary=%b", binary);

    gray = 4'b1110; #10;
    if (binary !== 4'b1010) $display("FAIL: gray=1110, expected binary=1010, got binary=%b", binary);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule