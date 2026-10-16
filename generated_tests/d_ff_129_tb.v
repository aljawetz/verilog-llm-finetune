`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg d;
  reg clk;
  reg rst;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
  d_ff uut (
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

    // Test 2: Check D input functionality
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to D when rst is low");
      $finish;
    end

    // Test 3: Check D input with reset
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to D when rst is low");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to D after reset");
      $finish;
    end

    // Test 6: Check D input with multiple changes
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to D after reset");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule