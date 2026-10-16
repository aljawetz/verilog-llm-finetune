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
    #10; // Wait for the first clock edge

    // Test case 1: Hold state (S=0, R=0)
    S = 0; R = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Set state (S=1, R=0)
    S = 1; R = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 3: Reset state (S=0, R=1)
    S = 0; R = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 4: Hold state (S=0, R=0)
    S = 0; R = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 5: Set state (S=1, R=0)
    S = 1; R = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 6: Undefined state (S=1, R=1)
    S = 1; R = 1; #10;
    if (q !== 1'bx) $display("FAIL: Expected q=x, got q=%b", q);

    // Test case 7: Reset state (S=0, R=1)
    S = 0; R = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule