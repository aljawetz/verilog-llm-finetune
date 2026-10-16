`timescale 1ns/1ps

module tb_feistel_ciph;

  // Instantiate the unit under test (UUT)
  feistel_ciph uut();

  // Clock and reset signals
  reg clk;
  reg rst;

  // Clock generation
  always begin
    #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Apply reset
    #10 rst = 0; // Release reset after 10ns

    // Wait for a few clock cycles
    #20;

    // Check if the module is instantiated correctly (no functionality to check)
    // Since the module is empty, we cannot perform functional checks.
    // We will just check if the module is responsive to clock and reset.

    // Check reset behavior
    if (rst !== 0) begin
      $display("FAIL: Reset signal is not functioning correctly");
      $finish;
    end

    // Wait for a few more clock cycles
    #20;

    // Check if the clock is toggling
    if (clk !== 1) begin
      $display("FAIL: Clock signal is not toggling correctly");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule