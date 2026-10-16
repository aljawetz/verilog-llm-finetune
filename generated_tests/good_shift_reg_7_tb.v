`timescale 1ns/1ps

module tb_good_shift_reg;

  reg clk;
  reg reset;
  reg d;
  wire dout;

  // Instantiate the module under test (uut)
  good_shift_reg uut (
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

    // Test case 1: Shift in a value
    d = 1; // Load 1 into the shift register
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after first clock cycle");
      $finish;
    end

    // Test case 2: Shift in another value
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: dout should be 1 after second clock cycle");
      $finish;
    end

    // Test case 3: Shift in a zero value
    d = 0; // Load 0 into the shift register
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: dout should be 1 after third clock cycle");
      $finish;
    end

    // Test case 4: Shift again
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after fourth clock cycle");
      $finish;
    end

    // Test case 5: Assert reset
    reset = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after reset");
      $finish;
    end

    // Test case 6: Check behavior after reset
    reset = 0; // Release reset
    d = 1; // Load 1 into the shift register
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after first clock cycle post-reset");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: dout should be 1 after second clock cycle post-reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule