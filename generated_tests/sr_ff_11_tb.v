`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg rst;
  reg s;
  reg r;
  wire q;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .rst(rst),
    .s(s),
    .r(r),
    .q(q)
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
    rst = 0; s = 0; r = 0; // Release reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Reset did not set output to 0");
      $finish;
    end

    // Test set functionality
    s = 1; r = 0; // Set
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: Set did not set output to 1");
      $finish;
    end

    // Test reset functionality
    s = 0; r = 1; // Reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Reset did not set output to 0");
      $finish;
    end

    // Test hold functionality
    s = 0; r = 0; // Hold state
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Hold did not maintain output state");
      $finish;
    end

    // Test invalid state (undefined)
    s = 1; r = 1; // Set and reset both high
    #10; // Wait for 10ns
    if (q !== 1'bx) begin
      $display("FAIL: Both set and reset high did not result in undefined state");
      $finish;
    end

    // Test reset again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Reset did not set output to 0 after undefined state");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule