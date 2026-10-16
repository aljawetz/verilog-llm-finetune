`timescale 1ns/1ps

module tb_d_ff;
  reg d;
  reg clk;
  reg rst;
  wire qn;

  // Instantiate the D Flip-Flop
  d_ff uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .qn(qn)
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
    #10;
    rst = 0; // Assert reset
    #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 after reset");
      $finish;
    end

    // Release reset
    rst = 1;
    #10;

    // Test case 1: Set d to 1
    d = 1;
    #10;
    if (qn !== 1'b1) begin
      $display("FAIL: qn should be 1 when d is 1");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when d is 0");
      $finish;
    end

    // Test case 3: Check state retention
    d = 1;
    #10;
    if (qn !== 1'b1) begin
      $display("FAIL: qn should be 1 when d is 1");
      $finish;
    end

    // Test case 4: Reset again
    rst = 0; // Assert reset
    #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule