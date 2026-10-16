`timescale 1ns/1ps

module tb_dff_sahr;
  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_sahr uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    d = 0;

    // Apply reset
    #2 rst = 0; // Assert reset
    #10 rst = 1; // Deassert reset

    // Test 1: Check reset behavior
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop behavior
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d (expected 1)");
      $finish;
    end

    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d (expected 0)");
      $finish;
    end

    // Test 3: Check behavior with reset during operation
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    rst = 0; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 1'b0) begin
      $display("FAIL: q did not reset to 0 during operation");
      $finish;
    end

    // Test 4: Check behavior after reset
    rst = 1; // Deassert reset
    #10; // Wait for one clock cycle
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d after reset (expected 1)");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule