`timescale 1ns/1ps

module tb_moore_fsm_1010;
  reg din;
  reg reset;
  reg clk;
  wire y;

  // Instantiate the module under test
  moore_fsm_1010 uut (
    .din(din),
    .reset(reset),
    .clk(clk),
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
    reset = 1;
    din = 0;
    #10; // Wait for 10ns
    reset = 0;

    // Test sequence to detect 1010
    // Expected output y should be 0 until the sequence is detected
    #10 din = 1; // S0 -> S1
    #10 din = 0; // S1 -> S2
    #10 din = 1; // S2 -> S3
    #10 din = 0; // S3 -> S4
    #10 din = 0; // S4 -> S0, y should be 1
    if (y !== 1'b1) begin
      $display("FAIL: Expected y=1 after detecting 1010");
      $finish;
    end

    // Check for overlapping sequence
    #10 din = 1; // S0 -> S1
    #10 din = 0; // S1 -> S2
    #10 din = 1; // S2 -> S3
    #10 din = 0; // S3 -> S4
    #10 din = 0; // S4 -> S0, y should still be 1
    if (y !== 1'b1) begin
      $display("FAIL: Expected y=1 after detecting 1010 again");
      $finish;
    end

    // Reset and check y is 0
    #10 reset = 1; // Reset the FSM
    #10 reset = 0; // Release reset
    #10 din = 1; // S0 -> S1
    #10 din = 0; // S1 -> S2
    #10 din = 1; // S2 -> S3
    #10 din = 0; // S3 -> S4
    #10 din = 0; // S4 -> S0, y should be 1
    #10; // Wait for a moment
    if (y !== 1'b1) begin
      $display("FAIL: Expected y=1 after detecting 1010 post-reset");
      $finish;
    end

    // Final check to ensure y is 0 after the sequence
    #10 din = 1; // S0 -> S1
    #10 din = 0; // S1 -> S2
    #10 din = 1; // S2 -> S3
    #10 din = 0; // S3 -> S4
    #10 din = 0; // S4 -> S0, y should be 1
    #10 din = 1; // S0 -> S1
    #10 din = 1; // S1 stays in S1
    #10 din = 0; // S1 -> S2
    #10 din = 1; // S2 -> S3
    #10 din = 0; // S3 -> S4
    #10 din = 0; // S4 -> S0, y should be 1
    #10; // Wait for a moment
    if (y !== 1'b1) begin
      $display("FAIL: Expected y=1 after detecting 1010 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule