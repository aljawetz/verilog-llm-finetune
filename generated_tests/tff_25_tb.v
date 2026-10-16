`timescale 1ns/1ps

module tb_tff;
  reg clk;
  reg reset;
  reg t;
  wire q;

  // Instantiate the module under test (uut)
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
    // Initialize inputs
    reset = 1;
    t = 0;

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;

    // Test case 1: Check initial state
    if (q !== 1'b0) begin
      $display("FAIL: Initial state is not 0");
      $finish;
    end

    // Test case 2: Toggle T flip-flop
    t = 1; // Set T to toggle
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggle");
      $finish;
    end

    // Test case 3: Toggle again
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after second toggle");
      $finish;
    end

    // Test case 4: Hold state with T = 0
    t = 0; // Set T to hold
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to remain 0 when T is 0");
      $finish;
    end

    // Test case 5: Reset the flip-flop
    reset = 1; // Assert reset
    #10;       // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after reset");
      $finish;
    end

    // Test case 6: Release reset and toggle
    reset = 0; // Release reset
    t = 1;     // Set T to toggle
    #10;       // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggle post-reset");
      $finish;
    end

    // Test case 7: Final toggle
    #10;       // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after final toggle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule