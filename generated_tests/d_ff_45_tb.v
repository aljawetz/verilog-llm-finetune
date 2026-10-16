`timescale 1ns/1ps

module tb_d_ff;
  reg d;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
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
    // Initialize signals
    d = 0;
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Deassert reset

    // Test case 1: Check reset functionality
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Check D input propagation
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not update to D value");
      $finish;
    end

    // Test case 3: Check D input propagation with reset
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not update to D value");
      $finish;
    end

    // Test case 4: Check reset functionality again
    reset = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 5: Check D input propagation after reset
    reset = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not update to D value after reset");
      $finish;
    end

    // Test case 6: Check D input propagation with multiple changes
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not update to D value");
      $finish;
    end

    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not update to D value");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end
endmodule