`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg clk;
  reg d;

  // Outputs
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;

    // Wait for a negative edge to sample initial value
    #10;
    if (q !== 0) begin
      $display("FAIL: Initial output q should be 0");
      $finish;
    end

    // Test case 1: Set d to 1
    d = 1;
    #10; // Wait for negative edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 when d is 1");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10; // Wait for negative edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 when d is 0");
      $finish;
    end

    // Test case 3: Toggle d
    d = 1;
    #10; // Wait for negative edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 when d is toggled to 1");
      $finish;
    end

    d = 0;
    #10; // Wait for negative edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 when d is toggled to 0");
      $finish;
    end

    // Test case 4: Rapid toggling
    d = 1;
    #5; // Wait for half clock period
    d = 0;
    #5; // Wait for half clock period
    d = 1;
    #10; // Wait for negative edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after rapid toggling");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule