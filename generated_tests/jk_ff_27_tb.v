`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg rst;
  reg j;
  reg k;
  wire q;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
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
    rst = 1; j = 0; k = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Hold state (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 3: Clear state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 5: Reset state
    rst = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule