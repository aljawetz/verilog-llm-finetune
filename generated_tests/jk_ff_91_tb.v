`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .clk(clk),
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
    J = 0;
    K = 0;

    // Wait for a clock edge
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Initial state of q is not high");
      $finish;
    end

    // Test J = 0, K = 0 (no change)
    #10;
    J = 0; K = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should remain high when J=0 and K=0");
      $finish;
    end

    // Test J = 0, K = 1 (reset)
    #10;
    J = 0; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be low when J=0 and K=1");
      $finish;
    end

    // Test J = 1, K = 0 (set)
    #10;
    J = 1; K = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be high when J=1 and K=0");
      $finish;
    end

    // Test J = 1, K = 1 (toggle)
    #10;
    J = 1; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should toggle to low when J=1 and K=1");
      $finish;
    end

    // Toggle again
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should toggle to high when J=1 and K=1 again");
      $finish;
    end

    // Final check for q_bar
    #10;
    if (q_bar !== ~q) begin
      $display("FAIL: q_bar should be the complement of q");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule