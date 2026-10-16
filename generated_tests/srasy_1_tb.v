`timescale 1ns/1ps

module tb_srasy;
  reg clk;
  reg reset;
  reg s;
  reg r;
  wire q;

  // Instantiate the SR flip-flop module
  srasy uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
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
    reset = 1;
    s = 0;
    r = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: Set q to 1 (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 2: Set q to 0 (s=0, r=1)
    s = 0; r = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 3: Preserve state (s=0, r=0)
    s = 0; r = 0;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 4: Set q to 1 again (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 5: High-impedance state (s=1, r=1)
    s = 1; r = 1;
    #10;
    if (q !== 1'bz) $display("FAIL: Expected q=Z, got q=%b", q);

    // Test case 6: Reset (reset=1)
    reset = 1;
    #10;
    if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule