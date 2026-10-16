`timescale 1ns/1ps

module tb_bidirectional_reg;

  reg d;
  reg clk;
  reg en;
  reg dir;
  reg rstn;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  bidirectional_reg #(4) uut (
    .d(d),
    .clk(clk),
    .en(en),
    .dir(dir),
    .rstn(rstn),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    d = 0;
    en = 0;
    dir = 0;
    rstn = 0;

    // Reset the register
    #10;
    rstn = 1; // Release reset
    #10;

    // Test shifting left
    en = 1;
    dir = 0; // Shift left
    d = 1; #10; // out should be 0001
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    d = 1; #10; // out should be 0011
    if (out !== 4'b0011) $display("FAIL: Expected out = 0011, got out = %b", out);

    d = 0; #10; // out should be 0110
    if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);

    // Test shifting right
    dir = 1; // Shift right
    d = 1; #10; // out should be 1011
    if (out !== 4'b1011) $display("FAIL: Expected out = 1011, got out = %b", out);

    d = 0; #10; // out should be 0101
    if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

    // Test disable
    en = 0; #10; // out should remain 0101
    if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

    // Test reset
    rstn = 0; #10; // out should reset to 0000
    if (out !== 4'b0000) $display("FAIL: Expected out = 0000, got out = %b", out);

    rstn = 1; #10; // Release reset
    en = 1; dir = 0; d = 1; #10; // out should be 0001
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule