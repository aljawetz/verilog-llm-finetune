`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the module under test (uut)
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

    // Wait for a negative edge to initialize the flip-flop
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Initial state is not 1");
      $finish;
    end

    // Test J = 0, K = 0 (no change)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: State should remain 1 with J=0, K=0");
      $finish;
    end

    // Test J = 0, K = 1 (reset)
    J = 0; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: State should be 0 with J=0, K=1");
      $finish;
    end

    // Test J = 1, K = 0 (set)
    J = 1; K = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: State should be 1 with J=1, K=0");
      $finish;
    end

    // Test J = 1, K = 1 (toggle)
    J = 1; K = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: State should toggle to 0 with J=1, K=1");
      $finish;
    end

    #10;
    if (q !== 1'b1) begin
      $display("FAIL: State should toggle to 1 with J=1, K=1");
      $finish;
    end

    // Final check for toggle
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Final state should be 0 with J=1, K=1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule