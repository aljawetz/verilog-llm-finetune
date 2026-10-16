`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire Q;

  // Instantiate the JK flip-flop
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
    J = 0;
    K = 0;

    // Wait for a clock cycle
    #10;

    // Test case 1: Hold state (J=0, K=0)
    J = 0; K = 0; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
    
    // Toggle again
    #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Final state check
    J = 0; K = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule