`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    S = 0; R = 0;
    #10; // Wait for clock to stabilize

    // Test case 1: S=0, R=0 (Maintain state)
    S = 0; R = 0; #10;
    if (Q !== Q) $display("FAIL: Test case 1 failed (Maintain state)");

    // Test case 2: S=1, R=0 (Set Q to 1)
    S = 1; R = 0; #10;
    if (Q !== 1) $display("FAIL: Test case 2 failed (Set Q to 1)");

    // Test case 3: S=0, R=1 (Reset Q to 0)
    S = 0; R = 1; #10;
    if (Q !== 0) $display("FAIL: Test case 3 failed (Reset Q to 0)");

    // Test case 4: S=1, R=1 (Indeterminate state)
    S = 1; R = 1; #10;
    if (Q !== 1'bx) $display("FAIL: Test case 4 failed (Indeterminate state)");

    // Test case 5: S=0, R=0 (Maintain state)
    S = 0; R = 0; #10;
    if (Q !== 1'bx) $display("FAIL: Test case 5 failed (Maintain state after indeterminate)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule