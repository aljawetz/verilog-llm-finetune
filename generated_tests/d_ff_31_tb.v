`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .d(d),
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
    rst = 1; // Start with reset high
    d = 0;

    // Wait for a clock edge
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test capturing d
    d = 1; // Set d to 1
    #10; // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d");
      $finish;
    end

    // Change d and check q
    d = 0; // Change d to 0
    #10; // Wait for falling edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after capturing d");
      $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset again
    rst = 0;
    #10;

    // Final test to ensure d is captured
    d = 1; // Set d to 1
    #10; // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule