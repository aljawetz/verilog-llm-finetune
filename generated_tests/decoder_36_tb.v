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
    // Test Case 1: Disabled (en = 0), a = 0, b = 0
    en = 0; a = 0; b = 0;
    #10;
    if (y !== 4'b1110) begin
      $display("FAIL: Expected y = 1110 when en=0, a=0, b=0, got y = %b", y);
      $finish;
    end

    // Test Case 2: Disabled (en = 0), a = 0, b = 1
    en = 0; a = 0; b = 1;
    #10;
    if (y !== 4'b1101) begin
      $display("FAIL: Expected y = 1101 when en=0, a=0, b=1, got y = %b", y);
      $finish;
    end

    // Test Case 3: Disabled (en = 0), a = 1, b = 0
    en = 0; a = 1; b = 0;
    #10;
    if (y !== 4'b1011) begin
      $display("FAIL: Expected y = 1011 when en=0, a=1, b=0, got y = %b", y);
      $finish;
    end

    // Test Case 4: Disabled (en = 0), a = 1, b = 1
    en = 0; a = 1; b = 1;
    #10;
    if (y !== 4'b0111) begin
      $display("FAIL: Expected y = 0111 when en=0, a=1, b=1, got y = %b", y);
      $finish;
    end

    // Test Case 5: Enabled (en = 1)
    en = 1; a = 0; b = 0;
    #10;
    if (y !== 4'b1111) begin
      $display("FAIL: Expected y = 1111 when en=1, got y = %b", y);
      $finish;
    end

    // Test Case 6: Enabled (en = 1), a and b values should not matter
    en = 1; a = 1; b = 1;
    #10;
    if (y !== 4'b1111) begin
      $display("FAIL: Expected y = 1111 when en=1, got y = %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule