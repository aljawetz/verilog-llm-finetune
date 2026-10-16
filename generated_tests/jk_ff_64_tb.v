`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg M;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the module under test (uut)
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
    M = 0;
    J = 0;
    K = 0;

    // Wait for the first clock edge
    @(negedge clk);

    // Test case 1: No change (J=0, K=0)
    #1;
    if (q !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Reset (J=0, K=1)
    J = 0; K = 1;
    @(negedge clk);
    #1;
    if (q !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: Set (J=1, K=0)
    J = 1; K = 0;
    @(negedge clk);
    #1;
    if (q !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle (J=1, K=1)
    J = 1; K = 1;
    @(negedge clk);
    #1;
    if (q !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
      $finish;
    end

    @(negedge clk);
    #1;
    if (q !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Final check for toggle
    @(negedge clk);
    #1;
    if (q !== 0) begin
      $display("FAIL: Final toggle check failed, expected q=0, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule