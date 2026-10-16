`timescale 1ns/1ps

module tb_sequence_detector_mealy_0010;

  reg clk;
  reg reset;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  sequence_detector_mealy_0010 uut (
    .clk(clk),
    .reset(reset),
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
    reset = 1;
    in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test sequence: 0010
    // Expected output: out should go high after the sequence is detected
    // Input: 0
    in = 0; #10; // State: IDLE
    if (out !== 0) $display("FAIL: Expected out=0 in IDLE state");

    // Input: 0
    in = 0; #10; // State: s1
    if (out !== 0) $display("FAIL: Expected out=0 in s1 state");

    // Input: 1
    in = 1; #10; // State: s2
    if (out !== 0) $display("FAIL: Expected out=0 in s2 state");

    // Input: 0
    in = 0; #10; // State: s3
    if (out !== 1) $display("FAIL: Expected out=1 in s3 state after detecting 0010");

    // Reset the state
    reset = 1; #10;
    reset = 0; // Back to IDLE

    // Test another sequence: 0010
    // Input: 0
    in = 0; #10; // State: IDLE
    if (out !== 0) $display("FAIL: Expected out=0 in IDLE state");

    // Input: 0
    in = 0; #10; // State: s1
    if (out !== 0) $display("FAIL: Expected out=0 in s1 state");

    // Input: 1
    in = 1; #10; // State: s2
    if (out !== 0) $display("FAIL: Expected out=0 in s2 state");

    // Input: 0
    in = 0; #10; // State: s3
    if (out !== 1) $display("FAIL: Expected out=1 in s3 state after detecting 0010");

    // Final check
    $display("PASS");
    $finish;
  end

endmodule