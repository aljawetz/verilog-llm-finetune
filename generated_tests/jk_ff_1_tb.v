`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg reset;
  reg J;
  reg K;
  wire Q;
  wire Qn;

  // Instantiate the jk_ff module
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
      #10;

      // Release reset
      reset = 0;
      #10;

      // Test case 1: J = 0, K = 0 (Q should remain unchanged)
      J = 0; K = 0;
      #10;
      if (Q !== 0) begin
          $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);
          $finish;
      end

      // Test case 2: J = 0, K = 1 (Q should reset to 0)
      J = 0; K = 1;
      #10;
      if (Q !== 0) begin
          $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);
          $finish;
      end

      // Test case 3: J = 1, K = 0 (Q should set to 1)
      J = 1; K = 0;
      #10;
      if (Q !== 1) begin
          $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);
          $finish;
      end

      // Test case 4: J = 0, K = 1 (Q should reset to 0)
      J = 0; K = 1;
      #10;
      if (Q !== 0) begin
          $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
          $finish;
      end

      // Test case 5: J = 1, K = 0 (Q should set to 1)
      J = 1; K = 0;
      #10;
      if (Q !== 1) begin
          $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", Q);
          $finish;
      end

      // Test case 6: J = 1, K = 1 (Q should toggle)
      J = 1; K = 1;
      #10;
      if (Q !== 0) begin
          $display("FAIL: Test case 6 failed, expected Q=0, got Q=%b", Q);
          $finish;
      end

      #10;
      if (Q !== 1) begin
          $display("FAIL: Test case 6 failed, expected Q=1, got Q=%b", Q);
          $finish;
      end

      // Test case 7: Reset the flip-flop
      reset = 1;
      #10;
      if (Q !== 0) begin
          $display("FAIL: Test case 7 failed, expected Q=0 after reset, got Q=%b", Q);
          $finish;
      end

      // Final check
      $display("PASS");
      $finish;
  end

endmodule