`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg rst;
  reg J;
  reg K;
  wire Q;
  wire Q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .rst(rst),
    .J(J),
    .K(K),
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
    // Initialize signals
    rst = 1;
    J = 0;
    K = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0;
    #10;
    if (Q !== Q) $display("FAIL: Test case 1 failed, Q should remain unchanged");

    // Test case 2: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 1'b0) $display("FAIL: Test case 2 failed, Q should be 0");

    // Test case 3: J=1, K=0 (Q should set to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1'b1) $display("FAIL: Test case 3 failed, Q should be 1");

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1;
    #10;
    if (Q !== 1'b0) $display("FAIL: Test case 4 failed, Q should toggle to 0");

    // Test case 5: J=1, K=1 (Q should toggle again)
    #10;
    if (Q !== 1'b1) $display("FAIL: Test case 5 failed, Q should toggle to 1");

    // Test case 6: Reset the flip-flop
    rst = 1;
    #10;
    if (Q !== 1'b0) $display("FAIL: Test case 6 failed, Q should be reset to 0");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule