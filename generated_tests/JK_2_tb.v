`timescale 1ns/1ps

module tb_JK;

  reg J;
  reg K;
  reg rst;
  reg clk;
  wire q;
  wire qbar;

  // Instantiate the JK flip-flop
  JK uut (
    .J(J),
    .K(K),
    .rst(rst),
    .clk(clk),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1;
    J = 0;
    K = 0;
    #10;

    // Test reset functionality
    rst = 0; // Active-low reset
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not clear outputs");
      $finish;
    end

    // Release reset
    rst = 1;
    #10;

    // Test hold state (J=0, K=0)
    J = 0; K = 0;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Hold state failed");
      $finish;
    end

    // Test clear state (J=0, K=1)
    J = 0; K = 1;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Clear state failed");
      $finish;
    end

    // Test set state (J=1, K=0)
    J = 1; K = 0;
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Set state failed");
      $finish;
    end

    // Test toggle state (J=1, K=1)
    J = 1; K = 1;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: First toggle failed");
      $finish;
    end

    #10; // Wait for next clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Second toggle failed");
      $finish;
    end

    // Final check for hold state
    J = 0; K = 0;
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Hold state after toggle failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule