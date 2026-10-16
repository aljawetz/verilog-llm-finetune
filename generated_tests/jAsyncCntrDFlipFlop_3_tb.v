`timescale 1ns/1ps

module tb_jAsyncCntrDFlipFlop;

  reg clk;
  reg rst;
  reg d;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  jAsyncCntrDFlipFlop uut (
    .q(q),
    .qbar(qbar),
    .clk(clk),
    .rst(rst),
    .d(d)
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
    #3;
    rst = 0; // Release reset

    // Test case 1: Check initial state after reset
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test case 2: Set d to 1 and check output
    d = 1;
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Output is incorrect when d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check output
    d = 0;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Output is incorrect when d is set to 0");
      $finish;
    end

    // Test case 4: Assert reset functionality
    rst = 1; // Assert reset
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Output is incorrect after asserting reset");
      $finish;
    end

    // Test case 5: Check behavior with multiple clock edges
    rst = 0; // Release reset
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Output is incorrect after multiple clock edges with d=1");
      $finish;
    end

    d = 0;
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Output is incorrect after multiple clock edges with d=0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule