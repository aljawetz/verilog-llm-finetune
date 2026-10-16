`timescale 1ns/1ps

module tb_dff;
  reg reset;
  reg clk;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
  dff uut (
    .q(q),
    .reset(reset),
    .clk(clk),
    .d(d)
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
    d = 0;

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;
    #10;

    // Test case 1: Set d = 1, expect q = 1 after clock
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Set d = 0, expect q = 0 after clock
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: Assert reset, expect q = 0
    reset = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Test case 4: Release reset, set d = 1, expect q = 1 after clock
    reset = 0;
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 after clock, got q = %b", q);
      $finish;
    end

    // Test case 5: Set d = 0, expect q = 0 after clock
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after clock, got q = %b", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule