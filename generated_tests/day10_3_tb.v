`timescale 1ns/1ps

module tb_day10;

  reg clk;
  reg rst;
  reg load;
  reg [3:0] val;
  wire [3:0] q;

  // Instantiate the module under test (uut)
  day10 uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .val(val)
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
    load = 0;
    val = 4'b0000;

    // Release reset
    #10;
    rst = 0;

    // Test incrementing behavior
    #10;
    if (uut.q !== 4'b0000) $display("FAIL: Expected 0 after reset");

    // Increment and check values
    #10;
    if (uut.q !== 4'b0001) $display("FAIL: Expected 1 after first increment");

    #10;
    if (uut.q !== 4'b0010) $display("FAIL: Expected 2 after second increment");

    // Test loading a value
    load = 1;
    val = 4'b1010; // Load value 10
    #10;
    load = 0; // Release load
    if (uut.q !== 4'b1010) $display("FAIL: Expected 10 after loading value");

    // Continue incrementing
    #10;
    if (uut.q !== 4'b1011) $display("FAIL: Expected 11 after incrementing loaded value");

    #10;
    if (uut.q !== 4'b1100) $display("FAIL: Expected 12 after incrementing again");

    // Test reset functionality
    rst = 1;
    #10;
    if (uut.q !== 4'b0000) $display("FAIL: Expected 0 after reset");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule