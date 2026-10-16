`timescale 1ns/1ps

module tb_t_flip_flop;
  reg t;
  reg clk;
  reg rst;
  wire q;
  wire qbar;

  // Instantiate the T flip-flop module
  t_flip_flop uut (
    .t(t),
    .clk(clk),
    .rst(rst),
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
    rst = 1; t = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: T = 0, Q should remain the same
    t = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0, got Q = %b", q);
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1, got Q = %b", q);
      $finish;
    end

    // Test case 3: T = 1, Q should toggle again
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0, got Q = %b", q);
      $finish;
    end

    // Test case 4: Assert reset
    rst = 1;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0 after reset, got Q = %b", q);
      $finish;
    end

    // Test case 5: Release reset and T = 1, Q should toggle
    rst = 0;
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1, got Q = %b", q);
      $finish;
    end

    // Test case 6: T = 0, Q should remain the same
    t = 0;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1, got Q = %b", q);
      $finish;
    end

    // Test case 7: T = 1, Q should toggle
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0, got Q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule