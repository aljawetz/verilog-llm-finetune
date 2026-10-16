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
    // Initialize signals
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is active");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D input functionality
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Change D input
    d = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is active again");
      $finish;
    end

    // Release reset and test with d = 1
    rst = 0;
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 after d is set to 1 again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule