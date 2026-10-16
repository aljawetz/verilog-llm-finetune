`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;

  // Instantiate the module under test (uut)
  jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
    .q(q)
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
    #10; // Wait for 1 clock cycle

    // Test case 1: Hold state (J=0, K=0)
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Clear state (J=0, K=1)
    J = 0; K = 1;
    #10; // Wait for 1 clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10; // Wait for 1 clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Toggle again
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Final check for hold state
    J = 0; K = 0;
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule