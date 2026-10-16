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
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;
    reset = 1;

    // Test case 1: Check reset functionality
    reset = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Check D flip-flop behavior
    reset = 1; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when d = 1");
      $finish;
    end

    d = 0; // Change D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when d = 0");
      $finish;
    end

    d = 1; // Change D back to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when d = 1 again");
      $finish;
    end

    // Test case 3: Check reset functionality again
    reset = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule