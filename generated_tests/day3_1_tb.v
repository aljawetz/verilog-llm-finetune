`timescale 1ns/1ps

module tb_day3;

  // Inputs
  reg d;
  reg clk;
  reg rst;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
  day3 uut (
    .d(d),
    .clk(clk),
    .rst(rst),
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
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    rst = 0; // Deassert reset
    d = 1; // Set input to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1");
      $finish;
    end

    // Test 3: Change D input
    d = 0; // Change input to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to 0");
      $finish;
    end

    // Test 4: Check reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deassert reset
    d = 1; // Set input to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule