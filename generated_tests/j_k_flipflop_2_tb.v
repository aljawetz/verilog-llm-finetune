`timescale 1ns/1ps

module tb_j_k_flipflop;

  reg j, k, clk, rst_n;
  wire q, qb;

  // Instantiate the module under test (uut)
  j_k_flipflop uut (
    .q(q),
    .qb(qb),
    .j(j),
    .k(k),
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0; // Assert reset
    j = 0;
    k = 0;
    #10; // Wait for 10ns
    rst_n = 1; // Deassert reset
    #10;

    // Test case 1: J=0, K=0 (No change)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (Reset)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (Set)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (Toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Test case 5: J=0, K=0 (No change)
    j = 0; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule