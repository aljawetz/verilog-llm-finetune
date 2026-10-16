`timescale 1ns/1ps

module tb_sequence_det_overlap;

  reg a_in;
  reg clk;
  reg reset_n;
  wire d_out;

  // Instantiate the module under test (uut)
  sequence_det_overlap uut (
    .a_in(a_in),
    .clk(clk),
    .reset_n(reset_n),
    .d_out(d_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 0;
    a_in = 0;

    // Apply reset
    #10;
    reset_n = 1; // Release reset

    // Test case 1: No input, should not detect
    #10;
    if (d_out !== 1'b0) begin
      $display("FAIL: Expected d_out = 0 after reset and no input");
      $finish;
    end

    // Test case 2: Input sequence 1, 1, 1, 1
    #10 a_in = 1; // State transition to s0
    #10 a_in = 1; // State transition to s1
    #10 a_in = 1; // State transition to s2
    #10 a_in = 1; // State transition to s3, d_out should be 1
    #10;
    if (d_out !== 1'b1) begin
      $display("FAIL: Expected d_out = 1 after four consecutive ones");
      $finish;
    end

    // Test case 3: Input sequence 1, 1, 1, 0
    #10 a_in = 1; // Stay in s3
    #10 a_in = 0; // Transition to idle, d_out should be 0
    #10;
    if (d_out !== 1'b0) begin
      $display("FAIL: Expected d_out = 0 after input sequence 1, 1, 1, 0");
      $finish;
    end

    // Test case 4: Input sequence 1, 1, 0, 1, 1, 1, 1
    #10 a_in = 1; // State transition to s0
    #10 a_in = 1; // State transition to s1
    #10 a_in = 0; // Transition to idle
    #10 a_in = 1; // State transition to s0
    #10 a_in = 1; // State transition to s1
    #10 a_in = 1; // State transition to s2
    #10 a_in = 1; // State transition to s3, d_out should be 1
    #10;
    if (d_out !== 1'b1) begin
      $display("FAIL: Expected d_out = 1 after input sequence 1, 1, 0, 1, 1, 1, 1");
      $finish;
    end

    // Test case 5: Input sequence 0, 0, 0
    #10 a_in = 0; // Transition to idle
    #10 a_in = 0; // Stay in idle
    #10 a_in = 0; // Stay in idle
    #10;
    if (d_out !== 1'b0) begin
      $display("FAIL: Expected d_out = 0 after input sequence 0, 0, 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule