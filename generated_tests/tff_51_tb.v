`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg reset;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
    .q(q),
    .reset(reset),
    .clk(clk),
    .t(t)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    t = 0;

    // Wait for a clock edge
    #10;

    // Release reset
    reset = 0;

    // Test case 1: Check initial state
    if (q !== 1'b0) begin
      $display("FAIL: Initial state is not 0");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 after toggling");
      $finish;
    end

    // Test case 3: Toggle q again
    #10;   // Wait for another clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after toggling again");
      $finish;
    end

    // Test case 4: Check reset functionality
    reset = 1; // Assert reset
    #10;       // Wait for one clock cycle
    reset = 0; // Release reset
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Test case 5: Toggle q with t high after reset
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 after toggling post-reset");
      $finish;
    end

    // Test case 6: Do not toggle q when t is low
    t = 0; // Set T low
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should remain 1 when T is low");
      $finish;
    end

    // Test case 7: Toggle q again
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after toggling again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule