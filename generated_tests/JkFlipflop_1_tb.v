`timescale 1ns/1ps

module tb_JkFlipflop;

  reg j, k, clk, rst;
  wire q;

  // Instantiate the JkFlipflop module
  JkFlipflop uut (
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
    rst = 1; j = 0; k = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test HOLD condition
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: HOLD condition failed, expected q=0, got q=%b", q);

    // Test SET condition
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: SET condition failed, expected q=1, got q=%b", q);

    // Test RESET condition
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: RESET condition failed, expected q=0, got q=%b", q);

    // Test TOGGLE condition
    j = 1; k = 1; #10;
    if (q !== 1) $display("FAIL: TOGGLE condition failed on first toggle, expected q=1, got q=%b", q);
    #10; // Wait for next clock
    if (q !== 0) $display("FAIL: TOGGLE condition failed on second toggle, expected q=0, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule