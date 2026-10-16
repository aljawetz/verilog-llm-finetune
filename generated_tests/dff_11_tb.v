`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;
    reset = 0;

    // Test 1: Check reset functionality
    reset = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    reset = 0; // Deassert reset
    #10; // Wait for a clock edge

    // Test 2: Check D input functionality
    d = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when d is 1");
      $finish;
    end

    d = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when d is 0");
      $finish;
    end

    // Test 3: Check reset functionality again
    reset = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 4: Check D input functionality after reset
    reset = 0; // Deassert reset
    #10; // Wait for a clock edge
    d = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d after reset when d is 1");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule