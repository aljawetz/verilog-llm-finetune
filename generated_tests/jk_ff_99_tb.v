`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg rst;
  reg J;
  reg K;
  wire Q;
  wire Q_bar;

  // Instantiate the JK flip-flop
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

    // Release reset
    #10 rst = 0; // Active low reset
    #10 rst = 1; // Release reset

    // Test case 1: J=0, K=0 (No change)
    #10 J = 0; K = 0;
    #10 if (Q !== Q) $display("FAIL: Test case 1 failed (No change)"); // Q should remain the same

    // Test case 2: J=0, K=1 (Reset)
    #10 J = 0; K = 1;
    #10 if (Q !== 1'b0) $display("FAIL: Test case 2 failed (Reset)"); // Q should be 0

    // Test case 3: J=1, K=0 (Set)
    #10 J = 1; K = 0;
    #10 if (Q !== 1'b1) $display("FAIL: Test case 3 failed (Set)"); // Q should be 1

    // Test case 4: J=1, K=1 (Toggle)
    #10 J = 1; K = 1;
    #10 if (Q !== 1'b0) $display("FAIL: Test case 4 failed (Toggle)"); // Q should toggle to 0

    // Test case 5: J=0, K=1 (Reset again)
    #10 J = 0; K = 1;
    #10 if (Q !== 1'b0) $display("FAIL: Test case 5 failed (Reset again)"); // Q should remain 0

    // Test case 6: J=1, K=0 (Set again)
    #10 J = 1; K = 0;
    #10 if (Q !== 1'b1) $display("FAIL: Test case 6 failed (Set again)"); // Q should remain 1

    // Test case 7: J=1, K=1 (Toggle again)
    #10 J = 1; K = 1;
    #10 if (Q !== 1'b0) $display("FAIL: Test case 7 failed (Toggle again)"); // Q should toggle to 0

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule