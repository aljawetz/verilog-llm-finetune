`timescale 1ns/1ps

module tb_srff;

  reg clk;
  reg reset;
  reg s;
  reg r;
  wire q;

  // Instantiate the SR flip-flop
  srff uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
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
    reset = 1;
    s = 0;
    r = 0;
    #10; // Wait for reset to take effect

    // Test 1: Check reset functionality
    reset = 0; // Release reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    // Test 2: Set Q to 1
    s = 1; r = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Q did not set to 1 when S=1, R=0");
      $finish;
    end

    // Test 3: Set Q to 0
    s = 0; r = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Q did not set to 0 when S=0, R=1");
      $finish;
    end

    // Test 4: Retain state
    s = 0; r = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Q did not retain state when S=0, R=0");
      $finish;
    end

    // Test 5: Check invalid state (both S and R high)
    s = 1; r = 1;
    #10;
    if (q !== 1'bx) begin
      $display("FAIL: Q did not go to X when S=1, R=1");
      $finish;
    end

    // Test 6: Check state after invalid state
    s = 0; r = 0;
    #10;
    if (q !== 1'bx) begin
      $display("FAIL: Q did not retain X state after S=0, R=0");
      $finish;
    end

    // Final check: Reset again
    reset = 1;
    #10;
    reset = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0 again");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule