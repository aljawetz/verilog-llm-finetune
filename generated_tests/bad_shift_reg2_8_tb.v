`timescale 1ns/1ps

module tb_bad_shift_reg2;
  reg clk;
  reg reset;
  reg d;
  wire dout;

  // Instantiate the module under test
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

    // Test case 1: Check reset behavior
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after reset");
      $finish;
    end

    // Test case 2: Shift in a value
    d = 1; // Set input d to 1
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after first clock cycle");
      $finish;
    end

    // Test case 3: Shift in another value
    #10; // Wait for a clock cycle
    if (dout !== 1) begin
      $display("FAIL: dout should be 1 after second clock cycle");
      $finish;
    end

    // Test case 4: Shift in a value of 0
    d = 0; // Set input d to 0
    #10; // Wait for a clock cycle
    if (dout !== 1) begin
      $display("FAIL: dout should be 1 after third clock cycle");
      $finish;
    end

    // Test case 5: Shift in a value of 1 again
    d = 1; // Set input d to 1
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after fourth clock cycle");
      $finish;
    end

    // Test case 6: Check reset functionality again
    reset = 1; // Assert reset
    #10; // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: dout should be 0 after reset");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule