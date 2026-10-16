`timescale 1ns/1ps

module tb_jk_flipflop;

  reg J;
  reg K;
  reg clk;
  wire Q;

  // Instantiate the JK flip-flop
  jk_flipflop uut (
    .J(J),
    .K(K),
    .clk(clk),
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
    J = 0;
    K = 0;
    
    // Wait for a clock edge
    #10;
    
    // Test case 1: J = 1, K = 0 -> Q should be set to 1
    J = 1; K = 0;
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected Q = 1, got Q = %b", Q);
      $finish;
    end

    // Test case 2: J = 0, K = 1 -> Q should be set to 0
    J = 0; K = 1;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected Q = 0, got Q = %b", Q);
      $finish;
    end

    // Test case 3: J = 1, K = 1 -> Q should remain unchanged
    J = 1; K = 1;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected Q = 0, got Q = %b", Q);
      $finish;
    end

    // Test case 4: J = 0, K = 0 -> Q should remain unchanged
    J = 0; K = 0;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected Q = 0, got Q = %b", Q);
      $finish;
    end

    // Test case 5: J = 1, K = 0 -> Q should be set to 1 again
    J = 1; K = 0;
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected Q = 1, got Q = %b", Q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule