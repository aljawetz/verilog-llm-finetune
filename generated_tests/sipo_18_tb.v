`timescale 1ns/1ps

module tb_sipo;
  reg d;
  reg rst;
  reg clk;
  wire [3:0] qout;

  // Instantiate the module under test (uut)
  sipo uut (
    .d(d),
    .rst(rst),
    .clk(clk),
    .qout(qout)
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
    rst = 1; // Start with reset high
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test shifting in data
    d = 1; #10; // Shift in 1
    if (qout !== 4'b0001) $display("FAIL: Expected qout=0001, got %b", qout);

    d = 0; #10; // Shift in 0
    if (qout !== 4'b0001) $display("FAIL: Expected qout=0001, got %b", qout);

    d = 1; #10; // Shift in 1
    if (qout !== 4'b0010) $display("FAIL: Expected qout=0010, got %b", qout);

    d = 1; #10; // Shift in 1
    if (qout !== 4'b0110) $display("FAIL: Expected qout=0110, got %b", qout);

    d = 0; #10; // Shift in 0
    if (qout !== 4'b1100) $display("FAIL: Expected qout=1100, got %b", qout);

    // Test reset functionality
    rst = 1; #10; // Assert reset
    if (qout !== 4'b0000) $display("FAIL: Expected qout=0000 after reset, got %b", qout);

    rst = 0; // Release reset
    d = 1; #10; // Shift in 1
    d = 1; #10; // Shift in 1
    d = 0; #10; // Shift in 0
    d = 1; #10; // Shift in 1
    if (qout !== 4'b1101) $display("FAIL: Expected qout=1101, got %b", qout);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule