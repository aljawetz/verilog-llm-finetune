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
    J = 0; K = 0;
    #10; // Wait for a clock cycle

    // Test case 1: J=0, K=0 (no change)
    if (q !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: J=0, K=1 (reset)
    J = 0; K = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: J=1, K=0 (set)
    J = 1; K = 0;
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 4: J=1, K=1 (toggle)
    J = 1; K = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Toggle again
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Test case 4 toggle failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Final check for q_bar
    if (q_bar !== 1'b0) begin
      $display("FAIL: Final check failed, expected q_bar=0, got q_bar=%b", q_bar);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule