`timescale 1ns/1ps

module tb_day1;

  // Inputs
  reg d;
  reg clk;
  reg reset;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
  day1 uut (
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

    // Test 1: Check reset functionality
    reset = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check normal operation
    reset = 1; // Deassert reset
    d = 1; // Set data to 1
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q did not follow d after reset deassertion");
      $finish;
    end

    // Test 3: Change data input
    d = 0; // Change data to 0
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q did not follow d after data change");
      $finish;
    end

    // Test 4: Check reset again
    reset = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Final check with data
    reset = 1; // Deassert reset
    d = 1; // Set data to 1
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q did not follow d after final reset deassertion");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule