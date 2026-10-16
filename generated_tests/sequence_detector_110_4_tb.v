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
    forever #5 clk_i = ~clk_i; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_i = 1;
    seq_in = 0;
    #10; // Wait for 10ns

    // Release reset
    reset_i = 0;
    #10;

    // Test sequence: 110
    seq_in = 0; #10; // S0
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3, detect should be 1
    if (detect !== 1) begin
      $display("FAIL: Expected detect=1, got detect=%b", detect);
      $finish;
    end

    // Test sequence: 110 again
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3, detect should be 1
    if (detect !== 1) begin
      $display("FAIL: Expected detect=1, got detect=%b", detect);
      $finish;
    end

    // Test sequence: 101
    seq_in = 1; #10; // S1
    seq_in = 0; #10; // S0
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3, detect should be 1
    if (detect !== 1) begin
      $display("FAIL: Expected detect=1, got detect=%b", detect);
      $finish;
    end

    // Test sequence: 000
    seq_in = 0; #10; // S0
    seq_in = 0; #10; // S0
    seq_in = 0; #10; // S0
    if (detect !== 0) begin
      $display("FAIL: Expected detect=0, got detect=%b", detect);
      $finish;
    end

    // Test sequence: 1100
    seq_in = 1; #10; // S1
    seq_in = 1; #10; // S2
    seq_in = 0; #10; // S3, detect should be 1
    if (detect !== 1) begin
      $display("FAIL: Expected detect=1, got detect=%b", detect);
      $finish;
    end
    seq_in = 0; #10; // S0
    if (detect !== 0) begin
      $display("FAIL: Expected detect=0, got detect=%b", detect);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule