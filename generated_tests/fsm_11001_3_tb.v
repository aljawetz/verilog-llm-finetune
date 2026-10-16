`timescale 1ns/1ps

module tb_fsm_11001;
  reg din;
  reg clk;
  reg rst;
  wire y;

  // Instantiate the module under test
  fsm_11001 uut (
    .din(din),
    .clk(clk),
    .rst(rst),
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
    rst = 1;
    din = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test sequence to check state transitions and output
    // Sequence: 1, 1, 0, 0, 1, 0, 1
    // Expected output: y should be high when the sequence 11001 is detected

    // Step 1: Input 1
    din = 1; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 2: Input 1
    din = 1; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 3: Input 0
    din = 0; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 4: Input 0
    din = 0; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 5: Input 1
    din = 1; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // Step 6: Input 0
    din = 0; #10;
    if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

    // Step 7: Input 1
    din = 1; #10;
    if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule