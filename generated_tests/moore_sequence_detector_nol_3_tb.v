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
    // Initialize inputs
    rst = 0;
    x = 0;

    // Apply reset
    #10;
    rst = 1;

    // Test sequence to detect the sequence "110"
    // Expected output y should be high when the state reaches E
    // Sequence: 1 -> 1 -> 0 -> (E state)
    
    // Step 1: Input 1
    #10 x = 1; // Transition to state B
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 2: Input 1
    #10 x = 1; // Stay in state B
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 3: Input 0
    #10 x = 0; // Transition to state C
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 4: Input 0
    #10 x = 0; // Transition to state D
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 5: Input 1
    #10 x = 1; // Transition to state E
    #10; // Wait for next clock
    if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

    // Step 6: Input 0
    #10 x = 0; // Transition to state A
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 7: Input 1
    #10 x = 1; // Transition to state B
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 8: Input 1
    #10 x = 1; // Stay in state B
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 9: Input 0
    #10 x = 0; // Transition to state C
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 10: Input 0
    #10 x = 0; // Transition to state D
    #10; // Wait for next clock
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 11: Input 1
    #10 x = 1; // Transition to state E
    #10; // Wait for next clock
    if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule