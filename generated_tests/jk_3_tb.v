`timescale 1ns/1ps

module tb_jk;

  reg j;
  reg k;
  reg clk;
  wire q;
  wire qn;

  // Instantiate the module under test (uut)
  jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qn(qn)
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
    #10; // Wait for 10ns

    // Test case 1: j=0, k=0 (no change)
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    
    // Test case 2: j=0, k=1 (reset)
    k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    
    // Test case 3: j=1, k=0 (set)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    // Test case 4: j=1, k=1 (toggle)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    
    // Test case 5: j=1, k=1 (toggle again)
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    // Test case 6: j=0, k=0 (no change)
    j = 0; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule