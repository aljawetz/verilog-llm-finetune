`timescale 1ns/1ps

module tb_dflipflop;

  reg din;
  reg clk;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the D flip-flop
  dflipflop uut (
    .clk(clk),
    .rst(rst),
    .din(din),
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
    // Initialize signals
    din = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10; // Assert reset
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end
    rst = 0; #10; // Deassert reset

    // Test 2: Check D input propagation
    din = 1; #10; // Set din to 1
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: q did not follow din on rising edge");
      $finish;
    end

    // Test 3: Change D input
    din = 0; #10; // Change din to 0
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: q did not follow din on rising edge");
      $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test 5: Check D input propagation after reset
    rst = 0; #10; // Deassert reset
    din = 1; #10; // Set din to 1
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: q did not follow din on rising edge after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule