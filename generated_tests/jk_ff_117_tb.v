`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
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
    J = 0; K = 0;
    #10; // Wait for a clock cycle

    // Test case 1: Hold state (J=0, K=0)
    J = 0; K = 0;
    #10; // Wait for a clock cycle
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10; // Wait for a clock cycle
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10; // Wait for a clock cycle
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10; // Wait for a clock cycle
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);

    // Toggle again
    #10; // Wait for a clock cycle
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Final check for q_bar
    if (q_bar !== ~q) $display("FAIL: Final check failed, expected q_bar=%b, got q_bar=%b", ~q, q_bar);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule