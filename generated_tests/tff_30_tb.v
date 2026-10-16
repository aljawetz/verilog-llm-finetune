`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
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
    rstn = 0;
    t = 0;

    // Apply reset
    #10;
    rstn = 1; // Release reset
    #10;

    // Test case 1: T = 0, Q should remain the same
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0 after reset and T = 0");
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1 after T = 1");
      $finish;
    end

    // Test case 3: T = 0, Q should remain the same
    t = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1 after T = 0");
      $finish;
    end

    // Test case 4: T = 1, Q should toggle
    t = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0 after T = 1");
      $finish;
    end

    // Test case 5: Assert reset functionality
    rstn = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q = 0 after reset");
      $finish;
    end

    // Test case 6: Release reset and toggle
    rstn = 1; // Release reset
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected Q = 1 after reset and T = 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule