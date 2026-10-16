`timescale 1ns/1ps

module tb_d_ff;

  reg d;
  reg clk;
  reg rst;
  wire qn;
  wire qnbar;

  // Instantiate the D flip-flop
  d_ff uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .qn(qn),
    .qnbar(qnbar)
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
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10;
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset did not set qn to 0 and qnbar to 1");
      $finish;
    end

    // Test 2: Set d to 1 and clock
    rst = 0; d = 1; #10;
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: After clock with d=1, qn should be 1 and qnbar should be 0");
      $finish;
    end

    // Test 3: Set d to 0 and clock
    d = 0; #10;
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: After clock with d=0, qn should be 0 and qnbar should be 1");
      $finish;
    end

    // Test 4: Asynchronous reset during operation
    rst = 1; #10;
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset during operation did not set qn to 0 and qnbar to 1");
      $finish;
    end

    // Test 5: Check behavior after reset
    rst = 0; d = 1; #10;
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: After clock with d=1 post-reset, qn should be 1 and qnbar should be 0");
      $finish;
    end

    // Test 6: Final check with d=0
    d = 0; #10;
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: After clock with d=0, qn should be 0 and qnbar should be 1");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule