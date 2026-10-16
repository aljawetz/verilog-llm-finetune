`timescale 1ns/1ps

module tb_j_k_flipflop;

  // Inputs
  reg j;
  reg k;
  reg clk;
  reg rst_n;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    rst_n = 0; // Assert reset
    j = 0;
    k = 0;
    #10; // Wait for 10ns
    rst_n = 1; // Deassert reset
    #10;

    // Test case 1: Hold state (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 3: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 5: Asynchronous reset
    rst_n = 0; // Assert reset
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);
    rst_n = 1; // Deassert reset
    #10;

    // Final check
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule