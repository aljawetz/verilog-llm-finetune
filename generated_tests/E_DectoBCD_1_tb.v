`timescale 1ns/1ps

module tb_E_DectoBCD;

  reg [9:0] inn;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  E_DectoBCD uut (
    .out(out),
    .inn(inn)
  );

  initial begin
    // Test cases
    // Test valid one-hot inputs
    inn = 10'b0000000001; #10; // Expect out = 4'b0000
    if (out !== 4'b0000) $display("FAIL: Expected 4'b0000 for input 10'b0000000001, got %b", out);
    
    inn = 10'b0000000010; #10; // Expect out = 4'b0001
    if (out !== 4'b0001) $display("FAIL: Expected 4'b0001 for input 10'b0000000010, got %b", out);
    
    inn = 10'b0000000100; #10; // Expect out = 4'b0010
    if (out !== 4'b0010) $display("FAIL: Expected 4'b0010 for input 10'b0000000100, got %b", out);
    
    inn = 10'b0000001000; #10; // Expect out = 4'b0011
    if (out !== 4'b0011) $display("FAIL: Expected 4'b0011 for input 10'b0000001000, got %b", out);
    
    inn = 10'b0000010000; #10; // Expect out = 4'b0100
    if (out !== 4'b0100) $display("FAIL: Expected 4'b0100 for input 10'b0000010000, got %b", out);
    
    inn = 10'b0000100000; #10; // Expect out = 4'b0101
    if (out !== 4'b0101) $display("FAIL: Expected 4'b0101 for input 10'b0000100000, got %b", out);
    
    inn = 10'b0001000000; #10; // Expect out = 4'b0110
    if (out !== 4'b0110) $display("FAIL: Expected 4'b0110 for input 10'b0001000000, got %b", out);
    
    inn = 10'b0010000000; #10; // Expect out = 4'b0111
    if (out !== 4'b0111) $display("FAIL: Expected 4'b0111 for input 10'b0010000000, got %b", out);
    
    inn = 10'b0100000000; #10; // Expect out = 4'b1000
    if (out !== 4'b1000) $display("FAIL: Expected 4'b1000 for input 10'b0100000000, got %b", out);
    
    inn = 10'b1000000000; #10; // Expect out = 4'b1001
    if (out !== 4'b1001) $display("FAIL: Expected 4'b1001 for input 10'b1000000000, got %b", out);
    
    // Test invalid inputs
    inn = 10'b0000000000; #10; // Expect out = 4'bxxxx
    if (out !== 4'bxxxx) $display("FAIL: Expected 4'bxxxx for input 10'b0000000000, got %b", out);
    
    inn = 10'b0000000110; #10; // Expect out = 4'bxxxx
    if (out !== 4'bxxxx) $display("FAIL: Expected 4'bxxxx for input 10'b0000000110, got %b", out);
    
    inn = 10'b1111111111; #10; // Expect out = 4'bxxxx
    if (out !== 4'bxxxx) $display("FAIL: Expected 4'bxxxx for input 10'b1111111111, got %b", out);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule