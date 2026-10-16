`timescale 1ns/1ps

module tb_siso2;

  reg si;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test
  siso2 uut (
    .si(si),
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
    // Initialize signals
    si = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Shift in 4 bits
    si = 1; #10; // Shift in 1
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    
    si = 1; #10; // Shift in 1
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    si = 0; #10; // Shift in 0
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
    
    si = 1; #10; // Shift in 1
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Reset functionality
    rst = 1; #10; // Assert reset
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);
    rst = 0; #10; // Deassert reset

    // Test case 3: Shift in 4 bits again
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1
    si = 0; #10; // Shift in 0
    si = 1; #10; // Shift in 1

    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule