`timescale 1ns/1ps

module tb_d_ff;
  reg d;
  reg clk;
  reg rst;
  wire qn;

  // Instantiate the D flip-flop
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
    rst = 0;
    d = 0;

    // Test reset functionality
    #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when rst is low");
      $finish;
    end

    // Release reset
    rst = 1;

    // Test D flip-flop behavior
    d = 1; #10; // Set d to 1
    if (qn !== 1'b1) begin
      $display("FAIL: qn should be 1 when d is 1 and rst is high");
      $finish;
    end

    d = 0; #10; // Set d to 0
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when d is 0 and rst is high");
      $finish;
    end

    // Test reset again
    rst = 0; #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when rst is low");
      $finish;
    end

    // Release reset and test again
    rst = 1; #10;
    d = 1; #10;
    if (qn !== 1'b1) begin
      $display("FAIL: qn should be 1 when d is 1 and rst is high");
      $finish;
    end

    d = 0; #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when d is 0 and rst is high");
      $finish;
    end

    // Final reset check
    rst = 0; #10;
    if (qn !== 1'b0) begin
      $display("FAIL: qn should be 0 when rst is low");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule