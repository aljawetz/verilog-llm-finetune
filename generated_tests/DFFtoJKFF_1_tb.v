`timescale 1ns/1ps

module tb_DFFtoJKFF;

  reg J;
  reg K;
  reg CLK;
  wire Q;

  // Instantiate the module under test
  DFFtoJKFF uut (
    .J(J),
    .K(K),
    .CLK(CLK),
    .Q(Q)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    J = 0;
    K = 0;
    #10; // Wait for 10ns

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 2: J=1, K=0 (Q should set to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 3: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1;
    #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);
    #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule