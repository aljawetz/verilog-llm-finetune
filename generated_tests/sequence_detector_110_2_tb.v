`timescale 1ns/1ps

module tb_sequence_detector_110;

  reg clk_i;
  reg reset_i;
  reg seq_in;
  wire detect;

  // Instantiate the module under test (uut)
  sequence_detector_110 uut (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .seq_in(seq_in),
    .detect(detect)
  );

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_i = 1;
    seq_in = 0;
    #10; // Wait for a clock cycle

    // Release reset
    reset_i = 0;
    #10;

    // Test sequence: 110
    seq_in = 1; #10; // S0 -> S1
    seq_in = 1; #10; // S1 -> S2
    seq_in = 0; #10; // S2 -> S3 (detect should be high)

    if (detect !== 1) begin
      $display("FAIL: Expected detect to be 1 after sequence 110");
      $finish;
    end

    // Test sequence: 1100 (should reset after detecting)
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3 (detect should be high)
    seq_in = 0; #10; // S0 (detect should be low)

    if (detect !== 0) begin
      $display("FAIL: Expected detect to be 0 after sequence 1100");
      $finish;
    end

    // Test sequence: 1110 (should not detect)
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 1; #10; // S2 (still in S2)
    seq_in = 0; #10; // S3 (detect should be high)

    if (detect !== 1) begin
      $display("FAIL: Expected detect to be 1 after sequence 1110");
      $finish;
    end

    // Test sequence: 101 (should not detect)
    seq_in = 1; #10; // S1
    seq_in = 0; #10; // S0 (detect should be low)

    if (detect !== 0) begin
      $display("FAIL: Expected detect to be 0 after sequence 101");
      $finish;
    end

    // Final check
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3 (detect should be high)

    if (detect !== 1) begin
      $display("FAIL: Expected detect to be 1 after final sequence 110");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule