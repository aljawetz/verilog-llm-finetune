`timescale 1ns/1ps

module tb_seq;

  reg clk;
  reg rst_n;
  reg seq_in;
  wire seq_out;

  // Instantiate the module under test
  seq uut (
    .clk(clk),
    .rst_n(rst_n),
    .seq_in(seq_in),
    .seq_out(seq_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    seq_in = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test sequence: 01101
    #10 seq_in = 0; // IDLE -> S0
    #10 seq_in = 1; // S0 -> S1
    #10 seq_in = 1; // S1 -> S2
    #10 seq_in = 0; // S2 -> S3
    #10 seq_in = 1; // S3 -> S4
    #10; // Check seq_out
    if (seq_out !== 1'b1) begin
      $display("FAIL: Expected seq_out = 1 after detecting 01101");
      $finish;
    end

    // Reset and check again
    #10 rst_n = 0; // Assert reset
    #10 rst_n = 1; // Deassert reset

    // Test sequence: 01101 with noise
    #10 seq_in = 0; // IDLE -> S0
    #10 seq_in = 1; // S0 -> S1
    #10 seq_in = 1; // S1 -> S2
    #10 seq_in = 0; // S2 -> S3
    #10 seq_in = 1; // S3 -> S4
    #10; // Check seq_out
    if (seq_out !== 1'b1) begin
      $display("FAIL: Expected seq_out = 1 after detecting 01101");
      $finish;
    end

    // Test sequence: 011010
    #10 seq_in = 0; // S4 -> S0
    #10 seq_in = 1; // S0 -> S1
    #10 seq_in = 1; // S1 -> S2
    #10 seq_in = 0; // S2 -> S3
    #10 seq_in = 1; // S3 -> S4
    #10; // Check seq_out
    if (seq_out !== 1'b1) begin
      $display("FAIL: Expected seq_out = 1 after detecting 01101");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule