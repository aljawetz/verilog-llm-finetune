`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .d(d),
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

    // Wait for the first clock edge
    #10;

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial output q is not 0");
      $finish;
    end

    // Test case 2: Set d to 1 and check q on falling edge
    d = 1;
    #10; // Wait for the next falling edge
    if (q !== 1) begin
      $display("FAIL: Output q is not 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q on falling edge
    d = 0;
    #10; // Wait for the next falling edge
    if (q !== 0) begin
      $display("FAIL: Output q is not 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Toggle d and check q
    d = 1;
    #10; // Wait for the next falling edge
    if (q !== 1) begin
      $display("FAIL: Output q is not 1 after d is toggled to 1");
      $finish;
    end

    d = 0;
    #10; // Wait for the next falling edge
    if (q !== 0) begin
      $display("FAIL: Output q is not 0 after d is toggled to 0");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule