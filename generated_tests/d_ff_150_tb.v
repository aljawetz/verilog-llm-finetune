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

    // Wait for a clock edge
    #10;

    // Test case 1: Reset is low
    if (qn !== 1'b0) begin
      $display("FAIL: Expected qn to be 0 when rst is low");
      $finish;
    end

    // Test case 2: Reset is high, d = 1
    rst = 1; d = 1;
    #10; // Wait for clock edge
    if (qn !== 1'b1) begin
      $display("FAIL: Expected qn to be 1 when rst is high and d is 1");
      $finish;
    end

    // Test case 3: d = 0
    d = 0;
    #10; // Wait for clock edge
    if (qn !== 1'b0) begin
      $display("FAIL: Expected qn to be 0 when d is 0");
      $finish;
    end

    // Test case 4: Reset is low again
    rst = 0;
    #10; // Wait for clock edge
    if (qn !== 1'b0) begin
      $display("FAIL: Expected qn to be 0 when rst is low");
      $finish;
    end

    // Test case 5: Reset is high, d = 0
    rst = 1; d = 0;
    #10; // Wait for clock edge
    if (qn !== 1'b0) begin
      $display("FAIL: Expected qn to be 0 when rst is high and d is 0");
      $finish;
    end

    // Test case 6: Reset is high, d = 1
    d = 1;
    #10; // Wait for clock edge
    if (qn !== 1'b1) begin
      $display("FAIL: Expected qn to be 1 when rst is high and d is 1");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule