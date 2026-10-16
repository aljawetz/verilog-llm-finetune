`timescale 1ns/1ps

module tb_binary_to_gray;

  reg [3:0] b;
  wire [3:0] g;
  
  // Instantiate the module under test (uut)
  binary_to_gray uut (
    .b(b),
    .g(g)
  );

  initial begin
    // Test case 1: 0000 -> 0000
    b = 4'b0000; #10;
    if (g !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", g);
    
    // Test case 2: 0001 -> 0001
    b = 4'b0001; #10;
    if (g !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", g);
    
    // Test case 3: 0010 -> 0011
    b = 4'b0010; #10;
    if (g !== 4'b0011) $display("FAIL: Test case 3 failed, expected 0011, got %b", g);
    
    // Test case 4: 0011 -> 0010
    b = 4'b0011; #10;
    if (g !== 4'b0010) $display("FAIL: Test case 4 failed, expected 0010, got %b", g);
    
    // Test case 5: 0100 -> 0110
    b = 4'b0100; #10;
    if (g !== 4'b0110) $display("FAIL: Test case 5 failed, expected 0110, got %b", g);
    
    // Test case 6: 0101 -> 0111
    b = 4'b0101; #10;
    if (g !== 4'b0111) $display("FAIL: Test case 6 failed, expected 0111, got %b", g);
    
    // Test case 7: 0110 -> 0101
    b = 4'b0110; #10;
    if (g !== 4'b0101) $display("FAIL: Test case 7 failed, expected 0101, got %b", g);
    
    // Test case 8: 0111 -> 0100
    b = 4'b0111; #10;
    if (g !== 4'b0100) $display("FAIL: Test case 8 failed, expected 0100, got %b", g);
    
    // Test case 9: 1000 -> 1100
    b = 4'b1000; #10;
    if (g !== 4'b1100) $display("FAIL: Test case 9 failed, expected 1100, got %b", g);
    
    // Test case 10: 1001 -> 1101
    b = 4'b1001; #10;
    if (g !== 4'b1101) $display("FAIL: Test case 10 failed, expected 1101, got %b", g);
    
    // Test case 11: 1010 -> 1111
    b = 4'b1010; #10;
    if (g !== 4'b1111) $display("FAIL: Test case 11 failed, expected 1111, got %b", g);
    
    // Test case 12: 1011 -> 1110
    b = 4'b1011; #10;
    if (g !== 4'b1110) $display("FAIL: Test case 12 failed, expected 1110, got %b", g);
    
    // Test case 13: 1100 -> 1000
    b = 4'b1100; #10;
    if (g !== 4'b1000) $display("FAIL: Test case 13 failed, expected 1000, got %b", g);
    
    // Test case 14: 1101 -> 1001
    b = 4'b1101; #10;
    if (g !== 4'b1001) $display("FAIL: Test case 14 failed, expected 1001, got %b", g);
    
    // Test case 15: 1110 -> 1011
    b = 4'b1110; #10;
    if (g !== 4'b1011) $display("FAIL: Test case 15 failed, expected 1011, got %b", g);
    
    // Test case 16: 1111 -> 1010
    b = 4'b1111; #10;
    if (g !== 4'b1010) $display("FAIL: Test case 16 failed, expected 1010, got %b", g);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule