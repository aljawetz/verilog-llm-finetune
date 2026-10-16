`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;
  wire qbar;

  // Instantiate the T flip-flop
  tff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rstn = 0; // Assert reset
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    rstn = 1;
    #10; // Wait for 10ns

    // Test case 1: T = 0, Q should remain unchanged
    t = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Q did not toggle as expected");
      $finish;
    end

    // Test case 3: T = 1, Q should toggle again
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Q did not toggle as expected");
      $finish;
    end

    // Test case 4: T = 0, Q should remain unchanged
    t = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Q changed unexpectedly with T=0");
      $finish;
    end

    // Test case 5: Assert reset
    rstn = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Q did not reset as expected");
      $finish;
    end

    // Test case 6: Release reset and toggle
    rstn = 1;
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Q did not toggle after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule