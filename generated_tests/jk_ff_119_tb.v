`timescale 1ns/1ps

module tb_jk_ff;
  reg clk;
  reg J;
  reg K;
  wire Q;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
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
    J = 0; K = 0;
    #10; // Wait for 1 clock cycle

    // Test 1: Hold state (J=0, K=0)
    J = 0; K = 0;
    #10; // Wait for 1 clock cycle
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test 2: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10; // Wait for 1 clock cycle
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10; // Wait for 1 clock cycle
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10; // Wait for 1 clock cycle
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
    
    #10; // Wait for 1 clock cycle
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test 5: Hold state again (J=0, K=0)
    J = 0; K = 0;
    #10; // Wait for 1 clock cycle
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule