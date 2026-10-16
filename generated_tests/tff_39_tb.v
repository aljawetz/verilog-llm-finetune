`timescale 1ns/1ps

module tb_tff;

  reg t;
  reg rst;
  reg clk;
  wire Q;

  // Instantiate the T flip-flop
  tff uut (
    .t(t),
    .rst(rst),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    t = 0;

    // Apply reset
    #10;
    rst = 0; // Release reset

    // Test case 1: T = 0, Q should remain 0
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when T is 0");
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when T is 1 and Q was 0");
      $finish;
    end

    // Test case 3: T = 1, Q should toggle again
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when T is 1 and Q was 1");
      $finish;
    end

    // Test case 4: T = 0, Q should remain 0
    t = 0;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should remain 0 when T is 0");
      $finish;
    end

    // Test case 5: Assert reset, Q should be 0
    rst = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test case 6: Release reset, T = 1, Q should toggle
    rst = 0;
    t = 1;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 after reset is released and T is 1");
      $finish;
    end

    // Test case 7: T = 1, Q should toggle again
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after toggling with T = 1");
      $finish;
    end

    // Test case 8: T = 0, Q should remain 0
    t = 0;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should remain 0 when T is 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule