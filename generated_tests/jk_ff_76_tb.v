`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg rst;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the module under test (uut)
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
    // Initialize signals
    rst = 1;
    J = 0;
    K = 0;

    // Apply reset
    #10;
    rst = 0; // Active low reset
    #10;
    rst = 1; // Release reset

    // Test case 1: J=0, K=0 (no change)
    J = 0; K = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (reset)
    J = 0; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (set)
    J = 1; K = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (toggle)
    J = 1; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    
    #10; // Wait for next clock edge
    if (q !== 1) $display("FAIL: Test case 4 failed on toggle, expected q=1, got q=%b", q);

    // Test case 5: J=0, K=1 (reset again)
    J = 0; K = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule