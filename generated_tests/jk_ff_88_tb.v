`timescale 1ns/1ps

module tb_jk_ff;
  reg clk;
  reg reset;
  reg j;
  reg k;
  wire q;
  wire q_bar;

  // Instantiate the module under test (uut)
  jk_ff uut (
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
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
    // Initialize signals
    reset = 1;
    j = 0;
    k = 0;

    // Apply reset
    #10 reset = 0; // Active low reset
    #10 reset = 1; // Release reset

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

    // Test case 6: J=0, K=1 (Reset)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule