`timescale 1ns/1ps

module tb_bad_shift_reg2;

  reg clk;
  reg reset;
  reg d;
  wire dout;

  // Instantiate the module under test (uut)
  bad_shift_reg2 uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .dout(dout)
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
    #10; // Wait for a clock cycle

    // Release reset
    reset = 0;
    #10; // Wait for a clock cycle

    // Test case 1: Check initial output after reset
    if (dout !== 0) begin
      $display("FAIL: Initial output after reset should be 0");
      $finish;
    end

    // Test case 2: Shift in a value
    d = 1; // Set input
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after first clock with d=1");
      $finish;
    end

    // Test case 3: Shift in another value
    #10; // Wait for a clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should be 1 after second clock with d=1");
      $finish;
    end

    // Test case 4: Change input and check output
    d = 0; // Change input
    #10; // Wait for a clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should still be 1 after third clock with d=0");
      $finish;
    end

    // Test case 5: Shift in the new value
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after fourth clock with d=0");
      $finish;
    end

    // Test case 6: Assert reset and check output
    reset = 1; // Assert reset
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    // Test case 7: Release reset and check output
    reset = 0; // Release reset
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after releasing reset");
      $finish;
    end

    // Test case 8: Shift in a new value after reset
    d = 1; // Set input
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after first clock with d=1 after reset");
      $finish;
    end

    // Final check
    #10; // Wait for a clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should be 1 after second clock with d=1 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule