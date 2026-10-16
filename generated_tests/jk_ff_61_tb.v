`timescale 1ns/1ps

module tb_jk_ff;

  reg J;
  reg K;
  reg clk;
  reg rst;
  wire Q;

  // Instantiate the module under test (uut)
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
    // Initialize inputs
    J = 0; K = 0; rst = 1;
    #10; // Wait for reset

    // Release reset
    rst = 0;
    #10;

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should remain 0 when J=0, K=0");
      $finish;
    end

    // Test case 2: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when J=0, K=1");
      $finish;
    end

    // Test case 3: J=1, K=0 (Q should set to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when J=1, K=0");
      $finish;
    end

    // Test case 4: J=0, K=1 (Q should reset to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when J=0, K=1");
      $finish;
    end

    // Test case 5: J=1, K=1 (Q should toggle)
    J = 1; K = 1;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 after toggle when J=1, K=1");
      $finish;
    end
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after toggle when J=1, K=1");
      $finish;
    end

    // Test case 6: J=1, K=0 (Q should set to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when J=1, K=0");
      $finish;
    end

    // Test case 7: J=0, K=0 (Q should remain unchanged)
    J = 0; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Q should remain 1 when J=0, K=0");
      $finish;
    end

    // Test case 8: Reset the flip-flop
    rst = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule