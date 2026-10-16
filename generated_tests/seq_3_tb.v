`timescale 1ns/1ps

module tb_seq;

  reg clk;
  reg rst_n;
  reg seq_in;
  wire seq_out;

  // Instantiate the module under test (uut)
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
    #10; // Check seq_out should be high
    if (uut.seq_out !== 1'b1) begin
      $display("FAIL: Expected seq_out to be 1 after detecting 01101");
      $finish;
    end

    // Test sequence: 01101 followed by 0
    #10 seq_in = 0; // S4 -> S0
    #10 seq_in = 0; // IDLE -> S0
    #10 seq_in = 1; // S0 -> S1
    #10 seq_in = 1; // S1 -> S2
    #10 seq_in = 0; // S2 -> S3
    #10 seq_in = 1; // S3 -> S4
    #10; // Check seq_out should be high again
    if (uut.seq_out !== 1'b1) begin
      $display("FAIL: Expected seq_out to be 1 after detecting 01101 again");
      $finish;
    end

    // Test sequence: random bits
    #10 seq_in = 1; // S4 -> S2
    #10 seq_in = 0; // S2 -> S3
    #10 seq_in = 0; // S3 -> S0
    #10 seq_in = 1; // IDLE -> S1
    #10 seq_in = 0; // S1 -> S0
    #10 seq_in = 0; // S0 -> S0
    #10; // Check seq_out should be low
    if (uut.seq_out !== 1'b0) begin
      $display("FAIL: Expected seq_out to be 0 after random sequence");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule