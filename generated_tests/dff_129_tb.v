`timescale 1ns/1ps

module tb_dff;
  reg reset;
  reg clk;
  reg d;
  wire q;

  // Instantiate the D flip-flop
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

    // Apply reset
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset and set d
    reset = 0;
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after clock edge with d=1");
      $finish;
    end

    // Change d and clock again
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after clock edge with d=0");
      $finish;
    end

    // Assert reset again
    reset = 1;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset and test with different d values
    reset = 0;
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after clock edge with d=1");
      $finish;
    end

    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should remain 1 after clock edge with d=1");
      $finish;
    end

    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after clock edge with d=0");
      $finish;
    end

    // Final reset check
    reset = 1;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule