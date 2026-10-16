`timescale 1ns/1ps

module tb_ring_counter;

  // Parameters
  parameter N = 4;

  // Signals
  reg clk;
  reg rst;
  wire [N-1:0] q;

  // Instantiate the ring_counter module
  ring_counter #(N) uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check initial state
    if (q !== 4'b1000) begin
      $display("FAIL: Initial state is incorrect, got %b", q);
      $finish;
    end

    // Rotate and check states
    #10; // Wait for 1 clock cycle
    if (q !== 4'b0100) begin
      $display("FAIL: After 1 clock cycle, expected 0100, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0010) begin
      $display("FAIL: After 2 clock cycles, expected 0010, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: After 3 clock cycles, expected 0001, got %b", q);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b1000) begin
      $display("FAIL: After 4 clock cycles, expected 1000, got %b", q);
      $finish;
    end

    // Test reset functionality
    rst = 1;
    #10; // Wait for reset to take effect
    rst = 0;

    // Check initial state after reset
    if (q !== 4'b1000) begin
      $display("FAIL: After reset, expected 1000, got %b", q);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule