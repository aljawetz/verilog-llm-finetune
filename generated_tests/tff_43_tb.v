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
      $display("FAIL: Q should be 1 after toggling");
      $finish;
    end

    // Test case 3: T = 0, Q should remain 1
    t = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should remain 1 when T is 0");
      $finish;
    end

    // Test case 4: T = 1, Q should toggle to 0
    t = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after toggling");
      $finish;
    end

    // Test case 5: Assert reset functionality
    rstn = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test case 6: Release reset and toggle
    rstn = 1; // Release reset
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Q should be 1 after toggling post reset");
      $finish;
    end

    // Final check: Toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Q should be 0 after toggling again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule