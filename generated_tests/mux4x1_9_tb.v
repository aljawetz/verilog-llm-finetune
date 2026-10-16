`timescale 1ns/1ps

module tb_mux4x1;
  reg clk;
  reg [3:0] i;
  reg [1:0] s;
  wire y;

  // Instantiate the module under test (uut)
  mux4x1 uut (
    .clk(clk),
    .i(i),
    .s(s),
    .y(y)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Test case 1: Select input 0
    i = 4'b1010; // Inputs are 10 (i[0]), 10 (i[1]), 10 (i[2]), 10 (i[3])
    s = 2'b00;   // Select i[0]
    #10;         // Wait for one clock cycle
    if (y !== 1'b0) $display("FAIL: Expected y = 0 for s = 00, got y = %b", y);

    // Test case 2: Select input 1
    s = 2'b01;   // Select i[1]
    #10;         // Wait for one clock cycle
    if (y !== 1'b1) $display("FAIL: Expected y = 1 for s = 01, got y = %b", y);

    // Test case 3: Select input 2
    s = 2'b10;   // Select i[2]
    #10;         // Wait for one clock cycle
    if (y !== 1'b0) $display("FAIL: Expected y = 0 for s = 10, got y = %b", y);

    // Test case 4: Select input 3
    s = 2'b11;   // Select i[3]
    #10;         // Wait for one clock cycle
    if (y !== 1'b0) $display("FAIL: Expected y = 0 for s = 11, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule