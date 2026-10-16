`timescale 1ns/1ps

module tb_d_ff;
  reg din;
  reg clk;
  reg rst;
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
    // Initialize signals
    din = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Check reset behavior
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Check D flip-flop operation
    din = 1; #10; // Set din to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not set q to 1 and qb to 0");
      $finish;
    end

    din = 0; #10; // Set din to 0
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: D flip-flop did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 3: Check reset behavior again
    rst = 1; #10; // Assert reset
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 4: Check D flip-flop operation with multiple values
    rst = 0; // Deassert reset
    din = 1; #10; // Set din to 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not set q to 1 and qb to 0");
      $finish;
    end

    din = 1; #10; // Keep din at 1
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not maintain q at 1 and qb at 0");
      $finish;
    end

    din = 0; #10; // Set din to 0
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: D flip-flop did not set q to 0 and qb to 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule