`timescale 1ns/1ps

module tb_jk_ff;

  reg J;
  reg K;
  reg clk;
  reg rst;
  wire Q;

  // Instantiate the JK flip-flop
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
    J = 0; K = 0; rst = 1; 
    #10; // Wait for 10ns

    // Test reset functionality
    rst = 0; // Release reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    // Test J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; 
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not remain unchanged when J=0, K=0");
      $finish;
    end

    // Test J=0, K=1 (Q should reset to 0)
    J = 0; K = 1; 
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not reset to 0 when J=0, K=1");
      $finish;
    end

    // Test J=1, K=0 (Q should set to 1)
    J = 1; K = 0; 
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not set to 1 when J=1, K=0");
      $finish;
    end

    // Test J=1, K=1 (Q should toggle)
    J = 1; K = 1; 
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not toggle when J=1, K=1");
      $finish;
    end

    // Toggle again
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not toggle again when J=1, K=1");
      $finish;
    end

    // Test J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; 
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not remain unchanged when J=0, K=0");
      $finish;
    end

    // Final check
    rst = 1; // Assert reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not reset to 0 after asserting reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule