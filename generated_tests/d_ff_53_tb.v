`timescale 1ns/1ps

module tb_d_ff;
  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
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
    // Initialize
    rst = 1; // Active high reset
    d = 0;

    // Apply reset
    #3 rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset
    rst = 1;
    #10; // Wait for a clock edge

    // Test case 1: Set d to 1
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 when d is 1");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 when d is 0");
      $finish;
    end

    // Test case 3: Assert reset again
    #5 rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Test case 4: Release reset and set d to 1
    rst = 1;
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 when d is 1 after reset");
      $finish;
    end

    // Test case 5: Set d to 0 again
    d = 0;
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 when d is 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule