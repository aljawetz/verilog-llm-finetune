`timescale 1ns/1ps

module tb_jk_ff;
  reg J, K, clk, rst;
  wire Q;

  // Instantiate the jk_ff module
  jk_ff uut (
    .J(J),
    .K(K),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    J = 0; K = 0; rst = 1;
    #10; // Wait for reset

    // Release reset
    rst = 0;
    #10;

    // Test case 1: J=0, K=0 (Q should remain the same)
    J = 0; K = 0;
    #10;
    if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

    // Test case 2: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

    // Test case 3: J=1, K=0 (Q should set to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1;
    #10;
    if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
    #10;
    if (Q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);

    // Test case 5: Reset the flip-flop
    rst = 1;
    #10;
    if (Q !== 0) $display("FAIL: Test case 5 failed, expected Q=0 after reset, got Q=%b", Q);
    
    // End of tests
    $display("PASS");
    $finish;
  end
endmodule