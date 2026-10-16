`timescale 1ns/1ps

module tb_fsm_1;

  // Testbench signals
  reg clk;
  reg reset_n;
  reg a_in;
  wire d_out;

  // Instantiate the module under test (uut)
  fsm_1 uut (
    .clk(clk),
    .reset_n(reset_n),
    .a_in(a_in),
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

    // Test sequence
    // State s0
    #10; a_in = 0; // Expect d_out = 0
    if (d_out !== 1'b0) $display("FAIL: Expected d_out = 0 in state s0, got %b", d_out);

    // Transition to s1
    #10; a_in = 1; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s1, got %b", d_out);

    // Stay in s1
    #10; a_in = 0; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s1, got %b", d_out);

    // Transition to s2
    #10; a_in = 0; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s2, got %b", d_out);

    // Stay in s2
    #10; a_in = 1; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s2, got %b", d_out);

    // Transition to s1
    #10; a_in = 0; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s1, got %b", d_out);

    // Transition to s3
    #10; a_in = 1; // Expect d_out = 1
    if (d_out !== 1'b1) $display("FAIL: Expected d_out = 1 in state s3, got %b", d_out);

    // Transition to s0
    #10; a_in = 0; // Expect d_out = 0
    if (d_out !== 1'b0) $display("FAIL: Expected d_out = 0 in state s0, got %b", d_out);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule