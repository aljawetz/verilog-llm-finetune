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
    #10; // Wait for a clock edge

    // Test case 1: Hold state (J=0, K=0)
    if (q !== 1'b1) begin
      $display("FAIL: Initial state should be 1");
      $finish;
    end

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 when J=0, K=1");
      $finish;
    end

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 when J=1, K=0");
      $finish;
    end

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after toggle when J=1, K=1");
      $finish;
    end

    // Test case 5: Toggle state again (J=1, K=1)
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after toggle when J=1, K=1");
      $finish;
    end

    // Test case 6: Hold state again (J=0, K=0)
    J = 0; K = 0;
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 when J=0, K=0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule