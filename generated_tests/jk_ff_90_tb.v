`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
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
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test J = 0, K = 1 (Reset)
    J = 0; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q = 0 when J = 0, K = 1");
      $finish;
    end

    // Test J = 1, K = 0 (Set)
    J = 1; K = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q = 1 when J = 1, K = 0");
      $finish;
    end

    // Test J = 1, K = 1 (Toggle)
    J = 1; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q = 0 when J = 1, K = 1 (first toggle)");
      $finish;
    end

    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q = 1 when J = 1, K = 1 (second toggle)");
      $finish;
    end

    // Test J = 0, K = 0 (No Change)
    J = 0; K = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q = 1 when J = 0, K = 0");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule