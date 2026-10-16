`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg S;
  reg R;
  wire q;
  wire q_bar;

  // Instantiate the SR Flip-Flop
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
    #10; // Wait for a clock edge

    // Test case 1: S=0, R=0 (hold state)
    S = 0; R = 0; #10;
    if (q !== q) $display("FAIL: Test case 1 failed (hold state)");

    // Test case 2: S=1, R=0 (set state)
    S = 1; R = 0; #10;
    if (q !== 1'b1) $display("FAIL: Test case 2 failed (set state)");

    // Test case 3: S=0, R=1 (reset state)
    S = 0; R = 1; #10;
    if (q !== 1'b0) $display("FAIL: Test case 3 failed (reset state)");

    // Test case 4: S=1, R=1 (invalid state)
    S = 1; R = 1; #10;
    if (q !== 1'bx) $display("FAIL: Test case 4 failed (invalid state)");

    // Test case 5: S=0, R=0 (hold state again)
    S = 0; R = 0; #10;
    if (q !== q) $display("FAIL: Test case 5 failed (hold state)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule