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

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Check initial state
    if (q !== 1'b0) begin
      $display("FAIL: Initial state is not 0");
      $finish;
    end

    // Test case 2: Toggle when T is high
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggle");
      $finish;
    end

    // Test case 3: Toggle again
    #10;   // Wait for another clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after toggle");
      $finish;
    end

    // Test case 4: No toggle when T is low
    t = 0; // Set T low
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to remain 0 when T is low");
      $finish;
    end

    // Test case 5: Reset functionality
    reset = 1; // Assert reset
    #10;       // Wait for one clock cycle
    reset = 0; // Deassert reset
    #10;       // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after reset");
      $finish;
    end

    // Test case 6: Toggle after reset
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggle post-reset");
      $finish;
    end

    // Test case 7: Final toggle
    #10;   // Wait for another clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after final toggle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule