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
    // Initialize signals
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;
    
    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test setting d to 1
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1 and rst is low");
      $finish;
    end

    // Test setting d to 0
    d = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when d is 0 and rst is low");
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset and test with d = 1
    rst = 0;
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1 and rst is low");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule