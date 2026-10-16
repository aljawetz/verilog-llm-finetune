`timescale 1ns/1ps

module tb_sr_ff;
  reg rst;
  reg s;
  reg r;
  reg clk;
  wire q;

  // Instantiate the SR Flip-Flop
  sr_ff uut (
    .rst(rst),
    .s(s),
    .r(r),
    .q(q),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; s = 0; r = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    rst = 0; s = 0; r = 0; // Normal operation
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset");
      $finish;
    end

    // Test set functionality
    s = 1; r = 0; // Set q to 1
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 after set");
      $finish;
    end

    // Test reset functionality
    s = 0; r = 1; // Reset q to 0
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset");
      $finish;
    end

    // Test hold functionality
    s = 0; r = 0; // Hold q
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 while holding");
      $finish;
    end

    // Test invalid state
    s = 1; r = 1; // Invalid state
    #10;
    if (q !== 1'bx) begin
      $display("FAIL: Expected q = x for invalid state");
      $finish;
    end

    // Test reset again
    rst = 1; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule