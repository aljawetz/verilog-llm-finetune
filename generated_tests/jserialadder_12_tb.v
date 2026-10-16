`timescale 1ns/1ps

module tb_jserialadder;

  reg clk;
  reg rst;
  reg a;
  reg b;
  reg carryin;
  wire [3:0] y;
  wire carryout;
  wire isValid;
  wire currentsum;
  wire currentcarryout;
  wire [1:0] currentbitcount;

  // Instantiate the Unit Under Test (UUT)
  jserialadder uut (
    .y(y),
    .carryout(carryout),
    .isValid(isValid),
    .currentsum(currentsum),
    .currentcarryout(currentcarryout),
    .currentbitcount(currentbitcount),
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .carryin(carryin)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    a = 0;
    b = 0;
    carryin = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Add 1 + 1 with carryin = 0
    a = 1; b = 1; carryin = 0; #10;
    if (y !== 0 || carryout !== 1 || isValid !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: Add 1 + 0 with carryin = 0
    a = 1; b = 0; carryin = 0; #10;
    if (y !== 1 || carryout !== 0 || isValid !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: Add 0 + 1 with carryin = 0
    a = 0; b = 1; carryin = 0; #10;
    if (y !== 1 || carryout !== 0 || isValid !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: Add 1 + 1 with carryin = 1
    a = 1; b = 1; carryin = 1; #10;
    if (y !== 1 || carryout !== 1 || isValid !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: Add 1 + 1 + carryin = 1 (should produce 0 with carryout)
    a = 1; b = 1; carryin = 1; #10;
    if (y !== 0 || carryout !== 1 || isValid !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: Add 0 + 0 + carryin = 1 (should produce 1 with carryout = 0)
    a = 0; b = 0; carryin = 1; #10;
    if (y !== 1 || carryout !== 0 || isValid !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: Add 1 + 1 + carryin = 0 (should produce 0 with carryout = 1)
    a = 1; b = 1; carryin = 0; #10;
    if (y !== 0 || carryout !== 1 || isValid !== 1) $display("FAIL: Test case 7 failed");

    // Final check
    #10;
    if (currentbitcount !== 4) $display("FAIL: Bit count did not reach 4 as expected");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule