`timescale 1ns/1ps

module tb_good_latch;

  reg clk;
  reg reset;
  reg d;
  wire q;

  // Instantiate the module under test
  good_latch uut (
    .clk(clk),
    .reset(reset),
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
    // Initialize signals
    reset = 1;
    d = 0;
    #10;

    // Test reset functionality
    reset = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset and test loading d
    reset = 0; // Deassert reset
    d = 1;     // Set d to 1
    #10;       // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not load d when clk is high");
      $finish;
    end

    // Change d while clk is high
    d = 0;     // Change d to 0
    #10;       // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not load new d value when clk is high");
      $finish;
    end

    // Test reset again
    reset = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule