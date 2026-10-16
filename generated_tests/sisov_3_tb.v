`timescale 1ns/1ps

module tb_sisov;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  sisov uut (
    .clk(clk),
    .rst(rst),
    .in(in),
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
    #10; // Wait for some time

    // Release reset
    rst = 0;
    #10;

    // Test 1: Shift with input '1'
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // Test 2: Shift with input '0'
    in = 0; // Load '0' into MSB
    #10; // Wait for one clock cycle
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // Test 3: Shift with input '1'
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // Test 4: Shift with input '1' again
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // Test 5: Reset the register
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    rst = 0; // Release reset
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out=0 after reset, got out=%b", out);

    // Test 6: Shift with input '1' after reset
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // Test 7: Shift with input '0'
    in = 0; // Load '0' into MSB
    #10; // Wait for one clock cycle
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule