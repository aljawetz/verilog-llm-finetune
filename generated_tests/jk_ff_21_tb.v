`timescale 1ns/1ps

module tb_jk_ff;
  reg j;
  reg k;
  reg clk;
  wire q;

  // Instantiate the module under test
  jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
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
    j = 0; k = 0;
    #10; // Wait for 1 clock cycle

    // Test hold state (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0 when j=0, k=0, got q=%b", q);

    // Test set state (j=1, k=0)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1 when j=1, k=0, got q=%b", q);

    // Test reset state (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0 when j=0, k=1, got q=%b", q);

    // Test toggle state (j=1, k=1)
    j = 1; k = 1; #10;
    if (q !== 1) $display("FAIL: Expected q=1 when j=1, k=1, got q=%b", q);
    
    // Toggle again
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after toggle when j=1, k=1, got q=%b", q);

    // Test hold state again (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0 when j=0, k=0, got q=%b", q);

    // Final check for set state
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1 when j=1, k=0, got q=%b", q);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule