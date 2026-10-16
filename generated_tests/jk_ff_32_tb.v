`timescale 1ns/1ps

module tb_jk_ff;

  reg J, K, clk, rst;
  wire Q;

  // Instantiate the module under test
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
    // Initialize signals
    rst = 1; J = 0; K = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

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
    #10; // Wait for next clock edge
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 5: Hold state (J=0, K=0)
    J = 0; K = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 6: Reset state (J=0, K=1)
    J = 0; K = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule