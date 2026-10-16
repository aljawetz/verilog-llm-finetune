`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg S;
  reg R;
  wire q;
  wire q_bar;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .S(S),
    .R(R),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    S = 0;
    R = 0;
    #10; // Wait for a clock cycle

    // Test hold state
    S = 0; R = 0; #10;
    if (q !== 0) $display("FAIL: Hold state failed");

    // Test set state
    S = 1; R = 0; #10;
    if (q !== 1) $display("FAIL: Set state failed");

    // Test reset state
    S = 0; R = 1; #10;
    if (q !== 0) $display("FAIL: Reset state failed");

    // Test invalid state
    S = 1; R = 1; #10;
    if (q !== 1'bx) $display("FAIL: Invalid state failed");

    // Test hold state again
    S = 0; R = 0; #10;
    if (q !== 1'bx) $display("FAIL: Hold state after invalid failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule