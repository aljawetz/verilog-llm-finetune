`timescale 1ns/1ps

module tb_dlock;

  reg clk;
  reg clear;
  reg b_in;
  wire unlock;

  // Instantiate the module under test (uut)
  dlock uut (
    .unlock(unlock),
    .b_in(b_in),
    .clear(clear),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    clear = 1;
    b_in = 0;

    // Apply reset
    #2 clear = 0; // Assert clear
    #10 clear = 1; // Deassert clear

    // Test sequence for unlocking
    // Input sequence: 1, 0, 1, 1, 0, 0
    #10 b_in = 1; // State s0 -> s1
    #10 b_in = 0; // State s1 -> s2
    #10 b_in = 1; // State s2 -> s3
    #10 b_in = 1; // State s3 -> s4
    #10 b_in = 0; // State s4 -> s5
    #10 b_in = 0; // State s5 -> s0 (unlock should be asserted)

    // Check unlock signal
    if (unlock !== 1) begin
      $display("FAIL: Unlock not asserted after correct sequence");
      $finish;
    end

    // Reset and test incorrect sequence
    #10 clear = 0; // Assert clear
    #10 clear = 1; // Deassert clear

    // Input incorrect sequence: 1, 1, 0
    #10 b_in = 1; // State s0 -> s1
    #10 b_in = 1; // State s1 stays s1
    #10 b_in = 0; // State s1 -> s2

    // Check unlock signal
    if (unlock !== 0) begin
      $display("FAIL: Unlock asserted incorrectly after incorrect sequence");
      $finish;
    end

    // Test another correct sequence
    #10 b_in = 1; // State s2 -> s3
    #10 b_in = 1; // State s3 -> s4
    #10 b_in = 0; // State s4 -> s5
    #10 b_in = 0; // State s5 -> s0 (unlock should be asserted)

    // Check unlock signal again
    if (unlock !== 1) begin
      $display("FAIL: Unlock not asserted after second correct sequence");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule