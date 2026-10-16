`timescale 1ns/1ps

module tb_Excess3Encoder;
  reg [3:0] b;
  wire [3:0] e;

  // Instantiate the Excess3Encoder module
  Excess3Encoder uut (
    .b(b),
    .e(e)
  );

  initial begin
    // Test cases for Excess-3 encoding
    // Expected outputs are calculated based on the Excess-3 encoding rules
    b = 4'b0000; #10; // 0 -> 3 (0011)
    if (e !== 4'b0011) $display("FAIL: Expected 0011 for input 0000, got %b", e);
    
    b = 4'b0001; #10; // 1 -> 4 (0100)
    if (e !== 4'b0100) $display("FAIL: Expected 0100 for input 0001, got %b", e);
    
    b = 4'b0010; #10; // 2 -> 5 (0101)
    if (e !== 4'b0101) $display("FAIL: Expected 0101 for input 0010, got %b", e);
    
    b = 4'b0011; #10; // 3 -> 6 (0110)
    if (e !== 4'b0110) $display("FAIL: Expected 0110 for input 0011, got %b", e);
    
    b = 4'b0100; #10; // 4 -> 7 (0111)
    if (e !== 4'b0111) $display("FAIL: Expected 0111 for input 0100, got %b", e);
    
    b = 4'b0101; #10; // 5 -> 8 (1000)
    if (e !== 4'b1000) $display("FAIL: Expected 1000 for input 0101, got %b", e);
    
    b = 4'b0110; #10; // 6 -> 9 (1001)
    if (e !== 4'b1001) $display("FAIL: Expected 1001 for input 0110, got %b", e);
    
    b = 4'b0111; #10; // 7 -> 10 (1010)
    if (e !== 4'b1010) $display("FAIL: Expected 1010 for input 0111, got %b", e);
    
    b = 4'b1000; #10; // 8 -> 11 (1011)
    if (e !== 4'b1011) $display("FAIL: Expected 1011 for input 1000, got %b", e);
    
    b = 4'b1001; #10; // 9 -> 12 (1100)
    if (e !== 4'b1100) $display("FAIL: Expected 1100 for input 1001, got %b", e);
    
    b = 4'b1010; #10; // 10 -> 13 (1101)
    if (e !== 4'b1101) $display("FAIL: Expected 1101 for input 1010, got %b", e);
    
    b = 4'b1011; #10; // 11 -> 14 (1110)
    if (e !== 4'b1110) $display("FAIL: Expected 1110 for input 1011, got %b", e);
    
    b = 4'b1100; #10; // 12 -> 15 (1111)
    if (e !== 4'b1111) $display("FAIL: Expected 1111 for input 1100, got %b", e);
    
    b = 4'b1101; #10; // 13 -> 0000 (0000)
    if (e !== 4'b0000) $display("FAIL: Expected 0000 for input 1101, got %b", e);
    
    b = 4'b1110; #10; // 14 -> 0001 (0001)
    if (e !== 4'b0001) $display("FAIL: Expected 0001 for input 1110, got %b", e);
    
    b = 4'b1111; #10; // 15 -> 0010 (0010)
    if (e !== 4'b0010) $display("FAIL: Expected 0010 for input 1111, got %b", e);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule