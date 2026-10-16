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
    // Initialize Inputs
    en = 0; a = 0; b = 0;

    // Test cases
    // Test when enabled
    en = 1; 
    #10;
    if (y !== 4'b1111) begin
      $display("FAIL: Expected output 1111 when enabled, got %b", y);
      $finish;
    end

    // Test when disabled with a=0, b=0
    en = 0; a = 0; b = 0; 
    #10;
    if (y !== 4'b1110) begin
      $display("FAIL: Expected output 1110 for a=0, b=0, got %b", y);
      $finish;
    end

    // Test when disabled with a=0, b=1
    a = 0; b = 1; 
    #10;
    if (y !== 4'b1101) begin
      $display("FAIL: Expected output 1101 for a=0, b=1, got %b", y);
      $finish;
    end

    // Test when disabled with a=1, b=0
    a = 1; b = 0; 
    #10;
    if (y !== 4'b1011) begin
      $display("FAIL: Expected output 1011 for a=1, b=0, got %b", y);
      $finish;
    end

    // Test when disabled with a=1, b=1
    a = 1; b = 1; 
    #10;
    if (y !== 4'b0111) begin
      $display("FAIL: Expected output 0111 for a=1, b=1, got %b", y);
      $finish;
    end

    // Final check for enabled state
    en = 1; 
    #10;
    if (y !== 4'b1111) begin
      $display("FAIL: Expected output 1111 when enabled, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule