`timescale 1ns/1ps

module tb_siso;

  reg din;
  reg clk;
  reg reset;
  wire dout;

  // Instantiate the module under test (uut)
  siso uut (
    .din(din),
    .clk(clk),
    .reset(reset),
    .dout(dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    din = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Shift in a sequence of bits
    din = 1; #10; // Shift in 1
    if (dout !== 0) $display("FAIL: dout should be 0 after first shift");
    
    din = 0; #10; // Shift in 0
    if (dout !== 1) $display("FAIL: dout should be 1 after second shift");
    
    din = 1; #10; // Shift in 1
    if (dout !== 0) $display("FAIL: dout should be 0 after third shift");
    
    din = 1; #10; // Shift in 1
    if (dout !== 1) $display("FAIL: dout should be 1 after fourth shift");

    // Test case 2: Reset functionality
    reset = 1; #10; // Apply reset
    if (dout !== 0) $display("FAIL: dout should be 0 after reset");

    // Test case 3: Shift in after reset
    reset = 0; din = 0; #10; // Shift in 0
    if (dout !== 0) $display("FAIL: dout should be 0 after shifting in 0 post-reset");

    din = 1; #10; // Shift in 1
    if (dout !== 0) $display("FAIL: dout should be 0 after shifting in 1 post-reset");

    din = 1; #10; // Shift in 1
    if (dout !== 1) $display("FAIL: dout should be 1 after shifting in 1 again");

    din = 0; #10; // Shift in 0
    if (dout !== 1) $display("FAIL: dout should be 1 after shifting in 0");

    din = 1; #10; // Shift in 1
    if (dout !== 0) $display("FAIL: dout should be 0 after shifting in 1");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule