`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire Q;
  wire Q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
    .Q(Q),
    .Q_bar(Q_bar)
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
    #10; // Wait for one clock cycle

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; #10;
    if (Q !== Q) begin
      $display("FAIL: Test case 1 failed (J=0, K=0)");
      $finish;
    end

    // Test case 2: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1; #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Test case 2 failed (J=0, K=1)");
      $finish;
    end

    // Test case 3: J=1, K=0 (Q should set to 1)
    J = 1; K = 0; #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Test case 3 failed (J=1, K=0)");
      $finish;
    end

    // Test case 4: J=1, K=1 (Q should toggle)
    J = 1; K = 1; #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Test case 4 failed (J=1, K=1, expected Q=0)");
      $finish;
    end

    // Toggle again
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Test case 4 failed (J=1, K=1, expected Q=1)");
      $finish;
    end

    // Test case 5: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0; #10;
    if (Q !== Q) begin
      $display("FAIL: Test case 5 failed (J=0, K=0)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule