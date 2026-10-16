`timescale 1ns/1ps

module tb_binary_to_gray;

  // Parameters
  parameter size = 8;

  // Inputs
  reg [size-1:0] a;

  // Outputs
  wire [size-1:0] gray;

  // Instantiate the Unit Under Test (UUT)
  binary_to_gray uut (
    .a(a),
    .gray(gray)
  );

  // Test procedure
  initial begin
    // Test case 1: Input 0
    a = 8'b00000000; #10;
    if (gray !== 8'b00000000) $display("FAIL: Test case 1 failed, expected 00000000, got %b", gray);

    // Test case 2: Input 1
    a = 8'b00000001; #10;
    if (gray !== 8'b00000001) $display("FAIL: Test case 2 failed, expected 00000001, got %b", gray);

    // Test case 3: Input 2
    a = 8'b00000010; #10;
    if (gray !== 8'b00000011) $display("FAIL: Test case 3 failed, expected 00000011, got %b", gray);

    // Test case 4: Input 3
    a = 8'b00000011; #10;
    if (gray !== 8'b00000010) $display("FAIL: Test case 4 failed, expected 00000010, got %b", gray);

    // Test case 5: Input 4
    a = 8'b00000100; #10;
    if (gray !== 8'b00000110) $display("FAIL: Test case 5 failed, expected 00000110, got %b", gray);

    // Test case 6: Input 5
    a = 8'b00000101; #10;
    if (gray !== 8'b00000111) $display("FAIL: Test case 6 failed, expected 00000111, got %b", gray);

    // Test case 7: Input 6
    a = 8'b00000110; #10;
    if (gray !== 8'b00000101) $display("FAIL: Test case 7 failed, expected 00000101, got %b", gray);

    // Test case 8: Input 7
    a = 8'b00000111; #10;
    if (gray !== 8'b00000100) $display("FAIL: Test case 8 failed, expected 00000100, got %b", gray);

    // Test case 9: Input 255
    a = 8'b11111111; #10;
    if (gray !== 8'b10000000) $display("FAIL: Test case 9 failed, expected 10000000, got %b", gray);

    // Test case 10: Input 128
    a = 8'b10000000; #10;
    if (gray !== 8'b11000000) $display("FAIL: Test case 10 failed, expected 11000000, got %b", gray);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule