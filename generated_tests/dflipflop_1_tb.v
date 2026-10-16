`timescale 1ns/1ps

module tb_dflipflop;

  reg din;
  reg clk;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the D flip-flop module
  dflipflop uut (
    .din(din),
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
    // Initialize inputs
    din = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not clear output");
      $finish;
    end

    // Test 2: Set din to 1 and clock
    rst = 0; // Deassert reset
    din = 1; // Set input
    #10; // Wait for one clock cycle
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: Output did not capture input on clock edge");
      $finish;
    end

    // Test 3: Change din to 0 and clock
    din = 0; // Change input
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Output did not capture new input on clock edge");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not clear output again");
      $finish;
    end

    // Test 5: Check behavior with multiple clock cycles
    rst = 0; // Deassert reset
    din = 1; // Set input
    #10; // Wait for one clock cycle
    din = 0; // Change input
    #10; // Wait for one clock cycle
    din = 1; // Change input again
    #10; // Wait for one clock cycle
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: Output did not capture last input on clock edge");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule