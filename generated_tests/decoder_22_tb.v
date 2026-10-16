`timescale 1ns/1ps

module tb_decoder;

  // Inputs
  reg en;
  reg a;
  reg b;

  // Outputs
  wire [3:0] y;

  // Instantiate the Unit Under Test (UUT)
  decoder uut (
    .en(en),
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: en = 0, a = 0, b = 0
    en = 0; a = 0; b = 0;
    #10;
    if (y !== 4'b1110) $display("FAIL: Test case 1 failed, expected 4'b1110, got %b", y);

    // Test case 2: en = 0, a = 0, b = 1
    en = 0; a = 0; b = 1;
    #10;
    if (y !== 4'b1101) $display("FAIL: Test case 2 failed, expected 4'b1101, got %b", y);

    // Test case 3: en = 0, a = 1, b = 0
    en = 0; a = 1; b = 0;
    #10;
    if (y !== 4'b1011) $display("FAIL: Test case 3 failed, expected 4'b1011, got %b", y);

    // Test case 4: en = 0, a = 1, b = 1
    en = 0; a = 1; b = 1;
    #10;
    if (y !== 4'b0111) $display("FAIL: Test case 4 failed, expected 4'b0111, got %b", y);

    // Test case 5: en = 1
    en = 1; a = 0; b = 0;
    #10;
    if (y !== 4'b1111) $display("FAIL: Test case 5 failed, expected 4'b1111, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule