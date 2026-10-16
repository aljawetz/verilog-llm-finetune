`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .rst(rst),
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
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;
    
    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test D input assignment
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1");
      $finish;
    end

    // Change D input
    d = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when d is 0");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset and test with d = 1
    rst = 0;
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule