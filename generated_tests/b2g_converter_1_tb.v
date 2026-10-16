`timescale 1ns/1ps

module tb_b2g_converter;

  reg [3:0] binary;
  wire [3:0] gray;

  // Instantiate the module under test (uut)
  b2g_converter uut (
    .binary(binary),
    .gray(gray)
  );

  initial begin
    // Test cases
    binary = 4'b0000; #10;
    if (gray !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", gray);

    binary = 4'b0001; #10;
    if (gray !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", gray);

    binary = 4'b0010; #10;
    if (gray !== 4'b0011) $display("FAIL: Test case 3 failed, expected 0011, got %b", gray);

    binary = 4'b0011; #10;
    if (gray !== 4'b0010) $display("FAIL: Test case 4 failed, expected 0010, got %b", gray);

    binary = 4'b0100; #10;
    if (gray !== 4'b0110) $display("FAIL: Test case 5 failed, expected 0110, got %b", gray);

    binary = 4'b0101; #10;
    if (gray !== 4'b0111) $display("FAIL: Test case 6 failed, expected 0111, got %b", gray);

    binary = 4'b0110; #10;
    if (gray !== 4'b0101) $display("FAIL: Test case 7 failed, expected 0101, got %b", gray);

    binary = 4'b0111; #10;
    if (gray !== 4'b0100) $display("FAIL: Test case 8 failed, expected 0100, got %b", gray);

    binary = 4'b1000; #10;
    if (gray !== 4'b1100) $display("FAIL: Test case 9 failed, expected 1100, got %b", gray);

    binary = 4'b1001; #10;
    if (gray !== 4'b1101) $display("FAIL: Test case 10 failed, expected 1101, got %b", gray);

    binary = 4'b1010; #10;
    if (gray !== 4'b1111) $display("FAIL: Test case 11 failed, expected 1111, got %b", gray);

    binary = 4'b1011; #10;
    if (gray !== 4'b1110) $display("FAIL: Test case 12 failed, expected 1110, got %b", gray);

    binary = 4'b1100; #10;
    if (gray !== 4'b1000) $display("FAIL: Test case 13 failed, expected 1000, got %b", gray);

    binary = 4'b1101; #10;
    if (gray !== 4'b1001) $display("FAIL: Test case 14 failed, expected 1001, got %b", gray);

    binary = 4'b1110; #10;
    if (gray !== 4'b1011) $display("FAIL: Test case 15 failed, expected 1011, got %b", gray);

    binary = 4'b1111; #10;
    if (gray !== 4'b1010) $display("FAIL: Test case 16 failed, expected 1010, got %b", gray);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule