`timescale 1ns/1ps

module tb_srff;

  reg s;
  reg r;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the SR flip-flop
  srff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s = 0;
    r = 0;
    reset = 1; // Assert reset
    #10 reset = 0; // Deassert reset

    // Test case 1: Set the flip-flop
    s = 1; r = 0; #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Reset the flip-flop
    s = 0; r = 1; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: Hold state
    s = 0; r = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 5: Invalid state (both set and reset)
    s = 1; r = 1; #10;
    if (q !== 1'bx) begin
      $display("FAIL: Expected q=x, got q=%b", q);
      $finish;
    end

    // Test case 6: Reset after invalid state
    s = 0; r = 1; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule