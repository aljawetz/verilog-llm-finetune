`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    J = 0; K = 0;
    #10; // Wait for 1 clock cycle

    // Test hold state (J=0, K=0)
    J = 0; K = 0; #10;
    if (q !== 0) $display("FAIL: Hold state failed");

    // Test reset state (J=0, K=1)
    J = 0; K = 1; #10;
    if (q !== 0) $display("FAIL: Reset state failed");

    // Test set state (J=1, K=0)
    J = 1; K = 0; #10;
    if (q !== 1) $display("FAIL: Set state failed");

    // Test toggle state (J=1, K=1)
    J = 1; K = 1; #10;
    if (q !== 0) $display("FAIL: Toggle state failed");

    // Toggle again
    #10;
    if (q !== 1) $display("FAIL: Toggle state failed on second toggle");

    // Final state check
    J = 0; K = 0; #10;
    if (q !== 1) $display("FAIL: Final hold state failed");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule