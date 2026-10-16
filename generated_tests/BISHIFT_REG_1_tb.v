`timescale 1ns/1ps

module tb_BISHIFT_REG;

  parameter MSB = 4;
  reg d;
  reg clk;
  reg en;
  reg dir;
  reg rstn;
  wire [MSB-1:0] out;

  // Instantiate the module under test
  BISHIFT_REG #(MSB) uut (
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
    rstn = 0;
    en = 0;
    dir = 0;
    d = 0;

    // Reset the module
    #10;
    rstn = 1; // Release reset

    // Test case 1: Shift left with en = 1
    en = 1; dir = 0; d = 1; #10;
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    d = 1; #10;
    if (out !== 4'b0011) $display("FAIL: Expected out = 0011, got out = %b", out);

    d = 0; #10;
    if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);

    // Test case 2: Shift right with en = 1
    dir = 1; d = 1; #10;
    if (out !== 4'b1011) $display("FAIL: Expected out = 1011, got out = %b", out);

    d = 0; #10;
    if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

    // Test case 3: Disable shifting
    en = 0; #10;
    if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

    // Test case 4: Reset functionality
    rstn = 0; #10;
    if (out !== 4'b0000) $display("FAIL: Expected out = 0000, got out = %b", out);

    rstn = 1; en = 1; dir = 0; d = 1; #10;
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule