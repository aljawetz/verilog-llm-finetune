`timescale 1ns/1ps

module tb_LeftRightShiftRegister;

  reg clk;
  reg rst;
  reg mode;
  reg SI;
  wire SO;
  wire [3:0] SR;

  // Instantiate the module under test (uut)
  LeftRightShiftRegister uut (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .SI(SI),
    .SO(SO),
    .SR(SR)
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
    mode = 0;
    SI = 0;

    // Release reset
    #10;
    rst = 0;

    // Test left shift mode
    mode = 0; // Left shift
    SI = 1;   // Input data

    // Shift left with SI = 1
    #10; // clk cycle 1
    if (SR !== 4'b0001 || SO !== 0) $display("FAIL: Left shift failed on first input");
    
    SI = 1; // Input data
    #10; // clk cycle 2
    if (SR !== 4'b0011 || SO !== 1) $display("FAIL: Left shift failed on second input");

    SI = 0; // Input data
    #10; // clk cycle 3
    if (SR !== 4'b0110 || SO !== 1) $display("FAIL: Left shift failed on third input");

    SI = 1; // Input data
    #10; // clk cycle 4
    if (SR !== 4'b1101 || SO !== 0) $display("FAIL: Left shift failed on fourth input");

    // Reset
    rst = 1;
    #10;
    rst = 0;

    // Test right shift mode
    mode = 1; // Right shift
    SI = 1;   // Input data

    // Shift right with SI = 1
    #10; // clk cycle 5
    if (SR !== 4'b0001 || SO !== 0) $display("FAIL: Right shift failed on first input");

    SI = 0; // Input data
    #10; // clk cycle 6
    if (SR !== 4'b0000 || SO !== 1) $display("FAIL: Right shift failed on second input");

    SI = 1; // Input data
    #10; // clk cycle 7
    if (SR !== 4'b1000 || SO !== 0) $display("FAIL: Right shift failed on third input");

    SI = 0; // Input data
    #10; // clk cycle 8
    if (SR !== 4'b0100 || SO !== 1) $display("FAIL: Right shift failed on fourth input");

    // Final reset
    rst = 1;
    #10;
    rst = 0;

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule