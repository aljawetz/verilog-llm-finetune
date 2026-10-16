`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg din;
  reg clk;
  reg rst;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the D flip-flop
  d_ff uut (
    .q(q),
    .qb(qb),
    .din(din),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    din = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10; // Assert reset
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test 2: Check normal operation
    rst = 0; #10; // Release reset
    din = 1; #10; // Set din to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1, q should be 1 and qb should be 0");
      $finish;
    end

    din = 0; #10; // Set din to 0
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0, q should be 0 and qb should be 1");
      $finish;
    end

    // Test 3: Check reset during operation
    din = 1; #10; // Set din to 1
    rst = 1; #10; // Assert reset
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset during operation did not set q to 0 and qb to 1");
      $finish;
    end

    // Test 4: Check normal operation after reset
    rst = 0; #10; // Release reset
    din = 1; #10; // Set din to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After reset and setting din to 1, q should be 1 and qb should be 0");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule