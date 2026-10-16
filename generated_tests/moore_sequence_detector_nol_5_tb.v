`timescale 1ns/1ps

module tb_moore_sequence_detector_nol;
  reg clk;
  reg rst;
  reg x;
  wire y;

  // Instantiate the module under test (uut)
  moore_sequence_detector_nol uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 0;
    x = 0;

    // Reset the FSM
    #10;
    rst = 1; // Release reset
    #10;

    // Test sequence: 0, 1, 0, 1, 1
    // Expected output y should be 0 until state E is reached
    x = 0; #10; // State A
    if (y !== 0) $display("FAIL: Expected y=0 in state A, got y=%b", y);
    
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B, got y=%b", y);
    
    x = 0; #10; // State C
    if (y !== 0) $display("FAIL: Expected y=0 in state C, got y=%b", y);
    
    x = 0; #10; // State D
    if (y !== 0) $display("FAIL: Expected y=0 in state D, got y=%b", y);
    
    x = 1; #10; // State E
    if (y !== 1) $display("FAIL: Expected y=1 in state E, got y=%b", y);
    
    // Test sequence: 0, 1, 0, 1, 1, 0
    x = 0; #10; // State A
    if (y !== 0) $display("FAIL: Expected y=0 in state A, got y=%b", y);
    
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B, got y=%b", y);
    
    x = 0; #10; // State C
    if (y !== 0) $display("FAIL: Expected y=0 in state C, got y=%b", y);
    
    x = 0; #10; // State D
    if (y !== 0) $display("FAIL: Expected y=0 in state D, got y=%b", y);
    
    x = 1; #10; // State E
    if (y !== 1) $display("FAIL: Expected y=1 in state E, got y=%b", y);
    
    x = 0; #10; // State A
    if (y !== 0) $display("FAIL: Expected y=0 in state A, got y=%b", y);

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule