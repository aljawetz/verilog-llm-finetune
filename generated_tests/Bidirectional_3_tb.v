`timescale 1ns/1ps

module tb_Bidirectional;

  parameter n = 8;
  reg clk;
  reg reset;
  reg s_in;
  wire out;

  // Instantiate the module under test (uut)
  Bidirectional #(.n(n)) uut (
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
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test shifting in values
    s_in = 1; // Shift in 1
    #10;
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

    s_in = 0; // Shift in 0
    #10;
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

    s_in = 1; // Shift in 1
    #10;
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

    s_in = 1; // Shift in 1
    #10;
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

    // Reset the register
    reset = 1;
    #10;
    reset = 0;
    #10;

    // Check after reset
    if (out !== 0) $display("FAIL: Expected out = 0 after reset, got %b", out);

    // Shift in a sequence of bits
    s_in = 1; #10; // out should be 0
    s_in = 0; #10; // out should be 1
    s_in = 1; #10; // out should be 0
    s_in = 1; #10; // out should be 1
    s_in = 0; #10; // out should be 1
    s_in = 1; #10; // out should be 0
    s_in = 0; #10; // out should be 1
    s_in = 1; #10; // out should be 0

    // Final check
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule