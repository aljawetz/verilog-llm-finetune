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
    J = 0; K = 0;
    #10; // Wait for a clock cycle

    // Test case 1: J=0, K=0 (Q should hold its value)
    J = 0; K = 0; #10;
    if (Q !== 0) $display("FAIL: Q should hold its value when J=0, K=0");

    // Test case 2: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Q should be 0 when J=0, K=1");

    // Test case 3: J=1, K=0 (Q should set to 1)
    J = 1; K = 0; #10;
    if (Q !== 1) $display("FAIL: Q should be 1 when J=1, K=0");

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1; #10;
    if (Q !== 0) $display("FAIL: Q should toggle to 0 when J=1, K=1");

    // Test case 5: J=1, K=1 (Q should toggle again)
    #10;
    if (Q !== 1) $display("FAIL: Q should toggle to 1 when J=1, K=1 again");

    // Test case 6: J=0, K=0 (Q should hold its value)
    J = 0; K = 0; #10;
    if (Q !== 1) $display("FAIL: Q should hold its value when J=0, K=0");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule