`timescale 1ns/1ps

module tb_BcdToDecimal;

  reg [3:0] a;
  wire [9:0] y;

  // Instantiate the module under test (uut)
  BcdToDecimal uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test valid BCD inputs
    a = 4'b0000; #10; // BCD 0
    if (y !== 10'b0000000001) $display("FAIL: Expected 0000000001 for input 0000");
    
    a = 4'b0001; #10; // BCD 1
    if (y !== 10'b0000000010) $display("FAIL: Expected 0000000010 for input 0001");
    
    a = 4'b0010; #10; // BCD 2
    if (y !== 10'b0000000100) $display("FAIL: Expected 0000000100 for input 0010");
    
    a = 4'b0011; #10; // BCD 3
    if (y !== 10'b0000001000) $display("FAIL: Expected 0000001000 for input 0011");
    
    a = 4'b0100; #10; // BCD 4
    if (y !== 10'b0000010000) $display("FAIL: Expected 0000010000 for input 0100");
    
    a = 4'b0101; #10; // BCD 5
    if (y !== 10'b0000100000) $display("FAIL: Expected 0000100000 for input 0101");
    
    a = 4'b0110; #10; // BCD 6
    if (y !== 10'b0001000000) $display("FAIL: Expected 0001000000 for input 0110");
    
    a = 4'b0111; #10; // BCD 7
    if (y !== 10'b0010000000) $display("FAIL: Expected 0010000000 for input 0111");
    
    a = 4'b1000; #10; // BCD 8
    if (y !== 10'b0100000000) $display("FAIL: Expected 0100000000 for input 1000");
    
    a = 4'b1001; #10; // BCD 9
    if (y !== 10'b1000000000) $display("FAIL: Expected 1000000000 for input 1001");

    // Test invalid BCD inputs
    a = 4'b1010; #10; // Invalid BCD
    if (y !== 10'b0000000000) $display("FAIL: Expected 0000000000 for input 1010");
    
    a = 4'b1111; #10; // Invalid BCD
    if (y !== 10'b0000000000) $display("FAIL: Expected 0000000000 for input 1111");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule