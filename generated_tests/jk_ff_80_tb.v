`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg reset;
  reg J;
  reg K;
  wire Q;
  wire Qn;

  // Instantiate the module under test
  jk_ff uut (
      .clk(clk),
      .reset(reset),
      .J(J),
      .K(K),
      .Q(Q),
      .Qn(Qn)
  );

  // Clock generation
  initial begin
      clk = 0;
      forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
      // Initialize signals
      reset = 1;
      J = 0;
      K = 0;
      #10; // Wait for 10ns

      // Release reset
      reset = 0;
      #10;

      // Test case 1: J = 0, K = 0 (hold state)
      J = 0; K = 0;
      #10;
      if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

      // Test case 2: J = 0, K = 1 (reset Q)
      J = 0; K = 1;
      #10;
      if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

      // Test case 3: J = 1, K = 0 (set Q)
      J = 1; K = 0;
      #10;
      if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

      // Test case 4: J = 1, K = 1 (toggle Q)
      J = 1; K = 1;
      #10;
      if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
      #10;
      if (Q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);

      // Test case 5: Reset functionality
      reset = 1;
      #10;
      if (Q !== 0) $display("FAIL: Reset failed, expected Q=0, got Q=%b", Q);

      // If all tests pass
      $display("PASS");
      $finish;
  end

endmodule