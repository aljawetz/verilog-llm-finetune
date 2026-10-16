`timescale 1ns/1ps

module tb_bidir_shift_reg;

  reg in;
  reg clk;
  reg rst;
  reg dir;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  bidir_shift_reg uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .dir(dir),
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
    rst = 1;
    in = 0;
    dir = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test shifting right
    dir = 0; // Set direction to right
    in = 1;  // Input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    in = 0;  // Change input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b0000) $display("FAIL: Expected out = 0000, got out = %b", out);

    in = 1;  // Change input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b1000) $display("FAIL: Expected out = 1000, got out = %b", out);

    // Test shifting left
    dir = 1; // Set direction to left
    in = 1;  // Input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    in = 0;  // Change input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b0010) $display("FAIL: Expected out = 0010, got out = %b", out);

    in = 1;  // Change input data
    #10;     // Wait for one clock cycle
    if (out !== 4'b0100) $display("FAIL: Expected out = 0100, got out = %b", out);

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    if (out !== 4'b0000) $display("FAIL: Expected out = 0000 after reset, got out = %b", out);

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule