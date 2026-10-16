`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg M;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .M(M),
    .J(J),
    .K(K),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    M = 1'b0;
    J = 1'b0;
    K = 1'b0;

    // Wait for the first clock edge
    #10;

    // Test case 1: Maintain state (J=0, K=0)
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after maintain state, got q=%b", q);
      $finish;
    end

    // Test case 2: Reset (J=0, K=1)
    J = 1'b0; K = 1'b1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after reset, got q=%b", q);
      $finish;
    end

    // Test case 3: Set (J=1, K=0)
    J = 1'b1; K = 1'b0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after set, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle (J=1, K=1)
    J = 1'b1; K = 1'b1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after toggle, got q=%b", q);
      $finish;
    end

    // Test case 5: Toggle again (J=1, K=1)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after toggle, got q=%b", q);
      $finish;
    end

    // Test case 6: Maintain state (J=0, K=0)
    J = 1'b0; K = 1'b0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after maintain state, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule