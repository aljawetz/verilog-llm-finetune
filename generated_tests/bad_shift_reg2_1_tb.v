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
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: Check initial output after reset
    if (dout !== 0) begin
      $display("FAIL: Initial output after reset is not 0");
      $finish;
    end

    // Test case 2: Shift in a value
    d = 1; // Set input to 1
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after first clock cycle with d=1");
      $finish;
    end

    // Test case 3: Shift in another value
    #10; // Wait for another clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should be 1 after second clock cycle with d=1");
      $finish;
    end

    // Test case 4: Change input value
    d = 0; // Change input to 0
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should still be 1 after third clock cycle with d=0");
      $finish;
    end

    // Test case 5: Shift in a new value
    #10; // Wait for another clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after fourth clock cycle with d=0");
      $finish;
    end

    // Test case 6: Assert reset functionality
    reset = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    // Test case 7: Check output after reset and new input
    reset = 0; // Release reset
    d = 1; // Set input to 1
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Output should be 0 after reset and first clock cycle with d=1");
      $finish;
    end

    // Final check
    #10; // Wait for another clock cycle
    if (dout !== 1) begin
      $display("FAIL: Output should be 1 after second clock cycle with d=1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule