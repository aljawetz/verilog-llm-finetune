`timescale 1ns/1ps

module tb_binary_gray_4bit;

  reg [3:0] b;
  wire [3:0] g;

  // Instantiate the module under test (uut)
  binary_gray_4bit uut (
    .b(b),
    .g(g)
  );

  initial begin
    // Test cases
    // Test 0: Binary 0000 -> Gray 0000
    b = 4'b0000; #10;
    if (g !== 4'b0000) $display("FAIL: Test 0 failed, expected 0000, got %b", g);
    
    // Test 1: Binary 0001 -> Gray 0001
    b = 4'b0001; #10;
    if (g !== 4'b0001) $display("FAIL: Test 1 failed, expected 0001, got %b", g);
    
    // Test 2: Binary 0010 -> Gray 0011
    b = 4'b0010; #10;
    if (g !== 4'b0011) $display("FAIL: Test 2 failed, expected 0011, got %b", g);
    
    // Test 3: Binary 0011 -> Gray 0010
    b = 4'b0011; #10;
    if (g !== 4'b0010) $display("FAIL: Test 3 failed, expected 0010, got %b", g);
    
    // Test 4: Binary 0100 -> Gray 0110
    b = 4'b0100; #10;
    if (g !== 4'b0110) $display("FAIL: Test 4 failed, expected 0110, got %b", g);
    
    // Test 5: Binary 0101 -> Gray 0111
    b = 4'b0101; #10;
    if (g !== 4'b0111) $display("FAIL: Test 5 failed, expected 0111, got %b", g);
    
    // Test 6: Binary 0110 -> Gray 0101
    b = 4'b0110; #10;
    if (g !== 4'b0101) $display("FAIL: Test 6 failed, expected 0101, got %b", g);
    
    // Test 7: Binary 0111 -> Gray 0100
    b = 4'b0111; #10;
    if (g !== 4'b0100) $display("FAIL: Test 7 failed, expected 0100, got %b", g);
    
    // Test 8: Binary 1000 -> Gray 1100
    b = 4'b1000; #10;
    if (g !== 4'b1100) $display("FAIL: Test 8 failed, expected 1100, got %b", g);
    
    // Test 9: Binary 1001 -> Gray 1101
    b = 4'b1001; #10;
    if (g !== 4'b1101) $display("FAIL: Test 9 failed, expected 1101, got %b", g);
    
    // Test 10: Binary 1010 -> Gray 1111
    b = 4'b1010; #10;
    if (g !== 4'b1111) $display("FAIL: Test 10 failed, expected 1111, got %b", g);
    
    // Test 11: Binary 1011 -> Gray 1110
    b = 4'b1011; #10;
    if (g !== 4'b1110) $display("FAIL: Test 11 failed, expected 1110, got %b", g);
    
    // Test 12: Binary 1100 -> Gray 1010
    b = 4'b1100; #10;
    if (g !== 4'b1010) $display("FAIL: Test 12 failed, expected 1010, got %b", g);
    
    // Test 13: Binary 1101 -> Gray 1011
    b = 4'b1101; #10;
    if (g !== 4'b1011) $display("FAIL: Test 13 failed, expected 1011, got %b", g);
    
    // Test 14: Binary 1110 -> Gray 1001
    b = 4'b1110; #10;
    if (g !== 4'b1001) $display("FAIL: Test 14 failed, expected 1001, got %b", g);
    
    // Test 15: Binary 1111 -> Gray 1000
    b = 4'b1111; #10;
    if (g !== 4'b1000) $display("FAIL: Test 15 failed, expected 1000, got %b", g);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule