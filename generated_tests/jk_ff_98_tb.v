`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg rst;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .rst(rst),
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
    rst = 1;
    J = 0;
    K = 0;

    // Apply reset
    #2 rst = 0; // Assert reset
    #10 rst = 1; // Deassert reset

    // Test case 1: Hold state (J=0, K=0)
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

    // Test case 2: Set state (J=1, K=0)
    J = 1; K = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1 after J=1, K=0, got q=%b", q);

    // Test case 3: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after J=0, K=1, got q=%b", q);

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1 after J=1, K=1, got q=%b", q);
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after toggle, got q=%b", q);

    // Final check for q_bar
    if (q_bar !== ~q) $display("FAIL: Expected q_bar=%b, got q_bar=%b", ~q, q_bar);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule