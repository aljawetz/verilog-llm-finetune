`timescale 1ns/1ps

module tb_Bidirectional;

  parameter n = 8;
  reg clk;
  reg reset;
  reg s_in;
  wire out;

  // Instantiate the module under test (uut)
  Bidirectional uut (
    .out(out),
    .clk(clk),
    .reset(reset),
    .s_in(s_in)
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
    s_in = 0;
    #10; // Wait for a few clock cycles

    // Release reset
    reset = 0;
    #10;

    // Test shifting in values
    s_in = 1; #10; // Shift in 1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    s_in = 0; #10; // Shift in 0
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    s_in = 1; #10; // Shift in 1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    s_in = 1; #10; // Shift in 1
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // Reset the register
    reset = 1; #10;
    reset = 0; #10;

    // Check after reset
    if (out !== 0) $display("FAIL: Expected out=0 after reset, got out=%b", out);

    // Shift in more values
    s_in = 1; #10; // Shift in 1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    s_in = 0; #10; // Shift in 0
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    s_in = 1; #10; // Shift in 1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule