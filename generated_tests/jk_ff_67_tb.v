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
    // Initialize signals
    rst = 1; J = 0; K = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: J=0, K=0 (No change)
    J = 0; K = 0;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);
      $finish;
    end

    // Test case 2: J=0, K=1 (Reset Q to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);
      $finish;
    end

    // Test case 3: J=1, K=0 (Set Q to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);
      $finish;
    end

    // Test case 4: J=0, K=0 (No change)
    J = 0; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);
      $finish;
    end

    // Test case 5: J=1, K=1 (Toggle Q)
    J = 1; K = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Test case 5 failed, expected Q=0, got Q=%b", Q);
      $finish;
    end

    // Test case 6: J=1, K=1 (Toggle Q again)
    #10;
    if (Q !== 1) begin
      $display("FAIL: Test case 6 failed, expected Q=1, got Q=%b", Q);
      $finish;
    end

    // Test case 7: J=0, K=1 (Reset Q to 0)
    J = 0; K = 1;
    #10;
    if (Q !== 0) begin
      $display("FAIL: Test case 7 failed, expected Q=0, got Q=%b", Q);
      $finish;
    end

    // Test case 8: J=1, K=0 (Set Q to 1)
    J = 1; K = 0;
    #10;
    if (Q !== 1) begin
      $display("FAIL: Test case 8 failed, expected Q=1, got Q=%b", Q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule