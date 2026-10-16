`timescale 1ns/1ps

module tb_d_siso_reg;
  reg d;
  reg clk;
  wire q;

  // Instantiate the unit under test (UUT)
  d_siso_reg uut (
    .d(d),
    .clk(clk),
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

    // Wait for the clock to stabilize
    #10;

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test case 2: Set d to 1 and clock
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and clock
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Toggle d and clock multiple times
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule