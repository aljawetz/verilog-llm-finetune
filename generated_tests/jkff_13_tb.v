`timescale 1ns/1ps

module tb_jkff;

  reg clk;
  reg reset;
  reg j;
  reg k;
  wire q;

  // Instantiate the module under test (uut)
  jkff uut (
    .clk(clk),
    .reset(reset),
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
    // Initialize
    reset = 1;
    j = 0;
    k = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test case 1: J=0, K=0 (No change)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (Reset to 0)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (Set to 1)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (Toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    
    #10; // Wait for next clock
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Test case 5: J=0, K=0 (No change)
    j = 0; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);

    // Test case 6: J=0, K=1 (Reset to 0)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);

    // Test case 7: J=1, K=0 (Set to 1)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 7 failed, expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule