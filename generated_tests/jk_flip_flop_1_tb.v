`timescale 1ns/1ps

module tb_jk_flip_flop;

  reg J;
  reg K;
  reg CLK;
  reg RST;
  wire Q;
  wire Qn;

  // Instantiate the module under test
  jk_flip_flop uut (
    .J(J),
    .K(K),
    .CLK(CLK),
    .RST(RST),
    .Q(Q),
    .Qn(Qn)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    J = 0; K = 0; RST = 1; // Assert reset
    #10; // Wait for 10ns
    RST = 0; // Deassert reset

    // Test case 1: Hold state (J=0, K=0)
    #10; 
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Test case 1 failed (Hold state)");
      $finish;
    end

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1;
    #10; 
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Test case 2 failed (Reset state)");
      $finish;
    end

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0;
    #10; 
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Test case 3 failed (Set state)");
      $finish;
    end

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1;
    #10; 
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Test case 4 failed (Toggle state)");
      $finish;
    end

    // Test case 5: Toggle state again (J=1, K=1)
    #10; 
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Test case 5 failed (Toggle state)");
      $finish;
    end

    // Final check: Hold state (J=0, K=0)
    J = 0; K = 0;
    #10; 
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Final check failed (Hold state)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule