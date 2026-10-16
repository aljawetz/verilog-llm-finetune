`timescale 1ns/1ps

module tb_D_FF_with_asynchronous_reset;

  // Inputs
  reg d;
  reg clk;
  reg reset;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
  D_FF_with_asynchronous_reset uut (
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

    // Wait for a clock edge
    #10;

    // Test 1: Check reset functionality
    reset = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Deassert reset
    reset = 1;
    #10;

    // Test 2: Check D input capture
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q did not capture D input on rising edge");
      $finish;
    end

    // Test 3: Change D input
    d = 0; // Change D to 0
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: q did not capture new D input on rising edge");
      $finish;
    end

    // Test 4: Assert reset again
    reset = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check D input after reset
    reset = 1; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q did not capture D input after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule