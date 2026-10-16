`timescale 1ns/1ps

module tb_jkff;

  reg j, k, clk, rst;
  wire q;

  // Instantiate the module under test (uut)
  jkff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
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
    j = 0; k = 0; rst = 1; #10; // Apply reset
    rst = 0; #10;

    // Test case 1: J=0, K=0 (hold state)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (reset)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (set)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (toggle)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10; // Wait for next clock edge
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 5: J=0, K=1 (reset)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 6: J=0, K=0 (hold state)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 7: J=1, K=0 (set)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 8: J=1, K=1 (toggle)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10; // Wait for next clock edge
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule