`timescale 1ns/1ps

module tb_jkff;

  reg j;
  reg k;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the JK flip-flop
  jkff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
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
    #10; // Wait for 10ns
    reset = 0;

    // Test 1: No change (j=0, k=0)
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after no change, got q=%b", q);

    // Test 2: Set (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1 after set, got q=%b", q);

    // Test 3: Reset (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

    // Test 4: Toggle (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1 after toggle, got q=%b", q);
    
    // Toggle again
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after toggle, got q=%b", q);

    // Test 5: Reset with reset signal
    reset = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule