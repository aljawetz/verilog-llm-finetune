`timescale 1ns/1ps

module tb_decoder;
  reg a, b, c;
  wire [7:0] y;

  // Instantiate the decoder module
  decoder uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Test all possible input combinations
    // Test case 1: Input 000
    a = 0; b = 0; c = 0; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Expected 00000001 for input 000, got %b", y);
      $finish;
    end

    // Test case 2: Input 001
    a = 0; b = 0; c = 1; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Expected 00000010 for input 001, got %b", y);
      $finish;
    end

    // Test case 3: Input 010
    a = 0; b = 1; c = 0; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Expected 00000100 for input 010, got %b", y);
      $finish;
    end

    // Test case 4: Input 011
    a = 0; b = 1; c = 1; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Expected 00001000 for input 011, got %b", y);
      $finish;
    end

    // Test case 5: Input 100
    a = 1; b = 0; c = 0; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Expected 00010000 for input 100, got %b", y);
      $finish;
    end

    // Test case 6: Input 101
    a = 1; b = 0; c = 1; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Expected 00100000 for input 101, got %b", y);
      $finish;
    end

    // Test case 7: Input 110
    a = 1; b = 1; c = 0; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Expected 01000000 for input 110, got %b", y);
      $finish;
    end

    // Test case 8: Input 111
    a = 1; b = 1; c = 1; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Expected 10000000 for input 111, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule