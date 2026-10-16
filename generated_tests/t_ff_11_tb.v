`timescale 1ns/1ps

module tb_t_ff;

  reg clk;
  reg reset;
  reg t;
  wire q;
  wire qbar;

  // Instantiate the T flip-flop
  t_ff uut (
    .clk(clk),
    .reset(reset),
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
    reset = 1;
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: T = 0, Q should remain 0
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 when T is 0");
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should be 1 after toggling with T = 1");
      $finish;
    end

    // Test case 3: T = 1, Q should toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after toggling again with T = 1");
      $finish;
    end

    // Test case 4: Reset should set Q to 0
    reset = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test case 5: Release reset and toggle with T = 1
    reset = 0;
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should be 1 after toggling with T = 1");
      $finish;
    end

    // Test case 6: T = 0, Q should remain 1
    t = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should remain 1 when T is 0");
      $finish;
    end

    // Test case 7: T = 1, Q should toggle to 0
    t = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after toggling with T = 1");
      $finish;
    end

    // Test case 8: T = 1, Q should toggle to 1
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should be 1 after toggling again with T = 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule