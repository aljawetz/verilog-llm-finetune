`timescale 1ns/1ps

module tb_jk_ff;
  reg rst;
  reg j;
  reg k;
  reg clk;
  wire q;
  wire qbar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .rst(rst),
    .j(j),
    .k(k),
    .q(q),
    .qbar(qbar),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; j = 0; k = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: J=0, K=0 (no change)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (reset)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (set)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    
    #10; // Wait for next clock edge
    if (q !== 1) $display("FAIL: Test case 4 failed on toggle, expected q=1, got q=%b", q);

    // Test case 5: Reset the flip-flop
    rst = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0 after reset, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule