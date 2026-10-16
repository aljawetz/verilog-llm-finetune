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
    // Initialize signals
    rst = 1; d = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: Check reset functionality
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset did not set qn to 0 and qnbar to 1");
      $finish;
    end

    // Test case 2: Check D flip-flop functionality
    d = 1; #10; // Load 1
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: qn should be 1 and qnbar should be 0 after loading 1");
      $finish;
    end

    d = 0; #10; // Load 0
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: qn should be 0 and qnbar should be 1 after loading 0");
      $finish;
    end

    // Test case 3: Check reset during operation
    d = 1; #10; // Load 1
    rst = 1; #10; // Assert reset
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset during operation did not set qn to 0 and qnbar to 1");
      $finish;
    end

    rst = 0; // Release reset
    d = 1; #10; // Load 1 again
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: qn should be 1 and qnbar should be 0 after loading 1 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule