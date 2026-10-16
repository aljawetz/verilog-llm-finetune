`timescale 1ns/1ps

module tb_jk_ff;
  reg clk;
  reg rst;
  reg j;
  reg k;
  wire q;

  // Instantiate the jk_ff module
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
    rst = 0; // Release reset

    // Test case 1: Maintain state (j=0, k=0)
    #10; j = 0; k = 0; // q should remain unchanged
    #10; if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Reset (j=0, k=1)
    #10; j = 0; k = 1; // q should go to 0
    #10; if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 3: Set (j=1, k=0)
    #10; j = 1; k = 0; // q should go to 1
    #10; if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 4: Toggle (j=1, k=1)
    #10; j = 1; k = 1; // q should toggle
    #10; if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10; if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 5: Reset again (j=0, k=1)
    #10; j = 0; k = 1; // q should go to 0
    #10; if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 6: Maintain state (j=0, k=0)
    #10; j = 0; k = 0; // q should remain unchanged
    #10; if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule