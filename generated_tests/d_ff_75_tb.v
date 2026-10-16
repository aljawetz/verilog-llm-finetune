`timescale 1ns/1ps

module tb_d_ff;

  reg din;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D Flip-Flop
  d_ff uut (
    .q(q),
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
    rst = 1; // Assert reset

    // Wait for a clock edge
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Deassert reset
    rst = 0;
    #10;

    // Test setting din to 1
    din = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q should be 1 when din is 1");
      $finish;
    end

    // Test setting din to 0
    din = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when din is 0");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Deassert reset and test with multiple clock cycles
    rst = 0;
    din = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q should be 1 when din is 1");
      $finish;
    end

    din = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when din is 0");
      $finish;
    end

    // Final check
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule