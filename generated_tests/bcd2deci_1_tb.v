`timescale 1ns/1ps

module tb_bcd2deci;
  reg [3:0] a;
  wire [6:0] y;

  // Instantiate the module under test
  bcd2deci uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test valid BCD inputs
    a = 4'b0000; #10; // BCD 0
    if (y !== 7'b0000001) $display("FAIL: Expected 0000001 for BCD 0, got %b", y);
    
    a = 4'b0001; #10; // BCD 1
    if (y !== 7'b0000010) $display("FAIL: Expected 0000010 for BCD 1, got %b", y);
    
    a = 4'b0010; #10; // BCD 2
    if (y !== 7'b0000011) $display("FAIL: Expected 0000011 for BCD 2, got %b", y);
    
    a = 4'b0011; #10; // BCD 3
    if (y !== 7'b0000100) $display("FAIL: Expected 0000100 for BCD 3, got %b", y);
    
    a = 4'b0100; #10; // BCD 4
    if (y !== 7'b0000101) $display("FAIL: Expected 0000101 for BCD 4, got %b", y);
    
    a = 4'b0101; #10; // BCD 5
    if (y !== 7'b0000110) $display("FAIL: Expected 0000110 for BCD 5, got %b", y);
    
    a = 4'b0110; #10; // BCD 6
    if (y !== 7'b0000111) $display("FAIL: Expected 0000111 for BCD 6, got %b", y);
    
    a = 4'b0111; #10; // BCD 7
    if (y !== 7'b0001000) $display("FAIL: Expected 0001000 for BCD 7, got %b", y);
    
    a = 4'b1000; #10; // BCD 8
    if (y !== 7'b0001001) $display("FAIL: Expected 0001001 for BCD 8, got %b", y);
    
    a = 4'b1001; #10; // BCD 9
    if (y !== 7'b0001100) $display("FAIL: Expected 0001100 for BCD 9, got %b", y);
    
    // Test invalid BCD inputs
    a = 4'b1010; #10; // BCD 10
    if (y !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 10, got %b", y);
    
    a = 4'b1111; #10; // BCD 15
    if (y !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 15, got %b", y);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule