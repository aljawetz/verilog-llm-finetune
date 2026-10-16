`timescale 1ns/1ps

module tb_cointoss111;
  reg clk;
  reg rst;
  reg x;
  wire y;

  // Instantiate the module under test
  cointoss111 uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
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
    x = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test sequence to reach state d
    x = 0; #10; // Stay in state a
    if (uut.state !== 3'b000) $display("FAIL: Expected state a after reset");

    x = 1; #10; // Transition to state b
    if (uut.state !== 3'b001) $display("FAIL: Expected state b");

    x = 1; #10; // Transition to state c
    if (uut.state !== 3'b010) $display("FAIL: Expected state c");

    x = 1; #10; // Transition to state d
    if (uut.state !== 3'b011) $display("FAIL: Expected state d");
    if (uut.y !== 1) $display("FAIL: Output y should be 1 in state d");

    // Test returning to state a
    x = 0; #10; // Transition back to state a
    if (uut.state !== 3'b000) $display("FAIL: Expected state a after x=0 from state d");
    if (uut.y !== 0) $display("FAIL: Output y should be 0 in state a");

    // Test reset functionality
    rst = 1; #10; // Assert reset
    if (uut.state !== 3'b000) $display("FAIL: Expected state a after reset");
    if (uut.y !== 0) $display("FAIL: Output y should be 0 after reset");

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule