`timescale 1ns/1ps

module tb_LeftShiftRegister;

  reg clk;
  reg rst;
  reg SI;
  wire SO;
  wire [3:0] SR;

  // Instantiate the module under test (uut)
  LeftShiftRegister uut (
    .clk(clk),
    .rst(rst),
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
    SI = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test shifting with serial input
    SI = 1; #10; // Shift in 1
    if (SR !== 4'b0001 || SO !== 0) $display("FAIL: Test 1 failed");

    SI = 0; #10; // Shift in 0
    if (SR !== 4'b0010 || SO !== 1) $display("FAIL: Test 2 failed");

    SI = 1; #10; // Shift in 1
    if (SR !== 4'b0101 || SO !== 0) $display("FAIL: Test 3 failed");

    SI = 1; #10; // Shift in 1
    if (SR !== 4'b1011 || SO !== 1) $display("FAIL: Test 4 failed");

    SI = 0; #10; // Shift in 0
    if (SR !== 4'b0110 || SO !== 1) $display("FAIL: Test 5 failed");

    // Reset the register
    rst = 1; #10;
    if (SR !== 4'b0000 || SO !== 0) $display("FAIL: Reset test failed");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule