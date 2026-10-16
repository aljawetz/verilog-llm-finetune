`timescale 1ns/1ps

module tb_to7seg;

  reg point;
  reg [3:0] data_in;
  wire [7:0] segments;

  // Instantiate the module under test (uut)
  to7seg uut (
    .point(point),
    .data_in(data_in),
    .segments(segments)
  );

  initial begin
    // Test cases
    // Test case 1: Check for input 0
    point = 0; data_in = 4'h0; #10;
    if (segments !== 8'b10000000) $display("FAIL: Test case 0 failed");
    
    // Test case 2: Check for input 1
    point = 0; data_in = 4'h1; #10;
    if (segments !== 8'b11110001) $display("FAIL: Test case 1 failed");
    
    // Test case 3: Check for input 2
    point = 0; data_in = 4'h2; #10;
    if (segments !== 8'b01001000) $display("FAIL: Test case 2 failed");
    
    // Test case 4: Check for input 3
    point = 0; data_in = 4'h3; #10;
    if (segments !== 8'b01100000) $display("FAIL: Test case 3 failed");
    
    // Test case 5: Check for input 4
    point = 0; data_in = 4'h4; #10;
    if (segments !== 8'b00110010) $display("FAIL: Test case 4 failed");
    
    // Test case 6: Check for input 5
    point = 0; data_in = 4'h5; #10;
    if (segments !== 8'b00100100) $display("FAIL: Test case 5 failed");
    
    // Test case 7: Check for input 6
    point = 0; data_in = 4'h6; #10;
    if (segments !== 8'b00000100) $display("FAIL: Test case 6 failed");
    
    // Test case 8: Check for input 7
    point = 0; data_in = 4'h7; #10;
    if (segments !== 8'b11110000) $display("FAIL: Test case 7 failed");
    
    // Test case 9: Check for input 8
    point = 0; data_in = 4'h8; #10;
    if (segments !== 8'b00000000) $display("FAIL: Test case 8 failed");
    
    // Test case 10: Check for input 9
    point = 0; data_in = 4'h9; #10;
    if (segments !== 8'b00100000) $display("FAIL: Test case 9 failed");
    
    // Test case 11: Check for input A
    point = 0; data_in = 4'hA; #10;
    if (segments !== 8'b00010000) $display("FAIL: Test case A failed");
    
    // Test case 12: Check for input B
    point = 0; data_in = 4'hB; #10;
    if (segments !== 8'b00000011) $display("FAIL: Test case B failed");
    
    // Test case 13: Check for input C
    point = 0; data_in = 4'hC; #10;
    if (segments !== 8'b10001100) $display("FAIL: Test case C failed");
    
    // Test case 14: Check for input D
    point = 0; data_in = 4'hD; #10;
    if (segments !== 8'b01000010) $display("FAIL: Test case D failed");
    
    // Test case 15: Check for input E
    point = 0; data_in = 4'hE; #10;
    if (segments !== 8'b00001100) $display("FAIL: Test case E failed");
    
    // Test case 16: Check for input F
    point = 0; data_in = 4'hF; #10;
    if (segments !== 8'b00011100) $display("FAIL: Test case F failed");
    
    // Test case 17: Check point control
    point = 1; data_in = 4'h0; #10;
    if (segments !== 8'b10000001) $display("FAIL: Point control test failed for input 0");
    
    point = 1; data_in = 4'hF; #10;
    if (segments !== 8'b00011101) $display("FAIL: Point control test failed for input F");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule