`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
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

    // Wait for the global reset
    #10;

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial state of q is not 0");
      $finish;
    end

    // Test case 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not latch d=1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not latch d=0");
      $finish;
    end

    // Test case 4: Toggle d and check q
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not latch d=1 after toggle");
      $finish;
    end

    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not latch d=0 after toggle");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule