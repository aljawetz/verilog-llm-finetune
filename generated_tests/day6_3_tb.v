`timescale 1ns/1ps

module tb_day6;

  reg clk;
  reg rst;
  reg x;
  wire [3:0] sr;

  // Instantiate the module under test (uut)
  day6 uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .sr(sr)
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
    x = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test shifting in bits
    x = 1; #10; // Shift in 1
    if (sr !== 4'b0001) $display("FAIL: Expected sr = 0001, got sr = %b", sr);

    x = 0; #10; // Shift in 0
    if (sr !== 4'b0010) $display("FAIL: Expected sr = 0010, got sr = %b", sr);

    x = 1; #10; // Shift in 1
    if (sr !== 4'b0101) $display("FAIL: Expected sr = 0101, got sr = %b", sr);

    x = 1; #10; // Shift in 1
    if (sr !== 4'b1011) $display("FAIL: Expected sr = 1011, got sr = %b", sr);

    x = 0; #10; // Shift in 0
    if (sr !== 4'b0110) $display("FAIL: Expected sr = 0110, got sr = %b", sr);

    // Test reset functionality
    rst = 1; #10; // Assert reset
    if (sr !== 4'b0000) $display("FAIL: Expected sr = 0000 after reset, got sr = %b", sr);
    
    rst = 0; #10; // Release reset

    // Continue shifting after reset
    x = 1; #10; // Shift in 1
    if (sr !== 4'b0001) $display("FAIL: Expected sr = 0001 after reset, got sr = %b", sr);

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule