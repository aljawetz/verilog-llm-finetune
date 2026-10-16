`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg M;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .M(M),
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
    M = 1'b0; // M is not used in this test
    J = 1'b0;
    K = 1'b0;

    // Wait for a clock edge
    @(negedge clk);
    
    // Test case 1: Hold state (J=0, K=0)
    J = 1'b0; K = 1'b0;
    @(negedge clk);
    if (q !== 1'b1) $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);

    // Test case 2: Reset state (J=0, K=1)
    J = 1'b0; K = 1'b1;
    @(negedge clk);
    if (q !== 1'b0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: Set state (J=1, K=0)
    J = 1'b1; K = 1'b0;
    @(negedge clk);
    if (q !== 1'b1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: Toggle state (J=1, K=1)
    J = 1'b1; K = 1'b1;
    @(negedge clk);
    if (q !== 1'b0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    
    @(negedge clk);
    if (q !== 1'b1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule