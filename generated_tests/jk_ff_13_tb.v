`timescale 1ns/1ps

module tb_jk_ff;

  reg J, K, clk, rst;
  wire Q;
  
  // Instantiate the JK flip-flop
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
    rst = 1; J = 0; K = 0;
    #10; // Wait for clock edge
    rst = 0; // Release reset

    // Test case 1: Hold state (J=0, K=0)
    #10; J = 0; K = 0; // Q should remain unchanged
    #10; if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

    // Test case 2: Reset state (J=0, K=1)
    #10; J = 0; K = 1; // Q should be reset to 0
    #10; if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

    // Test case 3: Set state (J=1, K=0)
    #10; J = 1; K = 0; // Q should be set to 1
    #10; if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

    // Test case 4: Toggle state (J=1, K=1)
    #10; J = 1; K = 1; // Q should toggle
    #10; if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
    #10; if (Q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);

    // Test case 5: Hold state again (J=0, K=0)
    #10; J = 0; K = 0; // Q should remain unchanged
    #10; if (Q !== 1) $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", Q);

    // Test case 6: Asynchronous reset
    #10; rst = 1; // Assert reset
    #10; if (Q !== 0) $display("FAIL: Test case 6 failed, expected Q=0 after reset, got Q=%b", Q);
    
    // End of tests
    $display("PASS");
    $finish;
  end

endmodule