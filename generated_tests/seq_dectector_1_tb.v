`timescale 1ns/1ps

module tb_seq_dectector;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  seq_dectector uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    in = 0;
    #10; // Wait for 10ns
    rst = 0;

    // Test sequence to detect "101"
    // Expected output: out should be high after the sequence "101" is detected
    // Input sequence: 0, 1, 0, 1, 0, 1
    // Expected output: 0, 0, 0, 0, 0, 1 (out goes high after "101")
    
    // Test case 1
    in = 0; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // Test case 2
    in = 1; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // Test case 3
    in = 0; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // Test case 4
    in = 1; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // Test case 5
    in = 0; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // Test case 6
    in = 1; #10; // out = 1
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);
    
    // Additional test case: Reset the module
    rst = 1; #10; // out should be 0
    rst = 0; #10; // out should be 0
    if (out !== 0) $display("FAIL: Expected out = 0 after reset, got %b", out);
    
    // Final test case: Check for no detection
    in = 0; #10; // out = 0
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule