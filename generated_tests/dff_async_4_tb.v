`timescale 1ns/1ps

module tb_dff_async;

  reg d;
  reg clk;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the D flip-flop
  dff_async uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qb(qb)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1; d = 0;
    #10;

    // Test 1: Check reset functionality
    rst = 0; // Assert reset
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    rst = 1; // Deassert reset
    d = 1; #10; // Set d to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q should be 1 when d is 1");
      $finish;
    end

    // Test 3: Change D input
    d = 0; #10; // Change d to 0
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q should be 0 when d is 0");
      $finish;
    end

    // Test 4: Check asynchronous reset during operation
    rst = 0; #10; // Assert reset
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 during operation");
      $finish;
    end

    // Test 5: Check D flip-flop functionality after reset
    rst = 1; // Deassert reset
    d = 1; #10; // Set d to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q should be 1 when d is 1 after reset");
      $finish;
    end

    // Test 6: Final state check
    d = 0; #10; // Change d to 0
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q should be 0 when d is 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule