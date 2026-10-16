`timescale 1ns/1ps

module tb_mealy_sequence_detector_nol;
  reg clk;
  reg rst;
  reg x;
  wire y;

  // Instantiate the module under test (uut)
  mealy_sequence_detector_nol uut (
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

    // Apply reset
    #3 rst = 1; // Release reset after 3ns
    #2;

    // Test sequence: 1100 (should detect D state)
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B");
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B");
    x = 0; #10; // State C
    if (y !== 0) $display("FAIL: Expected y=0 in state C");
    x = 0; #10; // State D
    if (y !== 1) $display("FAIL: Expected y=1 in state D");

    // Reset and test sequence: 100 (should not detect)
    rst = 0; #5; // Assert reset
    rst = 1; #2; // Release reset
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B");
    x = 0; #10; // State C
    if (y !== 0) $display("FAIL: Expected y=0 in state C");
    
    // Reset and test sequence: 110 (should detect)
    rst = 0; #5; // Assert reset
    rst = 1; #2; // Release reset
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B");
    x = 1; #10; // State B
    if (y !== 0) $display("FAIL: Expected y=0 in state B");
    x = 0; #10; // State C
    if (y !== 0) $display("FAIL: Expected y=0 in state C");
    x = 0; #10; // State D
    if (y !== 1) $display("FAIL: Expected y=1 in state D");

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule