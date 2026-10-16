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
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10;

    // Test sequence to reach state d
    x = 0; // Stay in state a
    #10;
    if (uut.state !== 3'b000) $display("FAIL: Expected state a after reset");

    x = 1; // Transition to state b
    #10;
    if (uut.state !== 3'b001) $display("FAIL: Expected state b after x=1 from a");

    x = 1; // Transition to state c
    #10;
    if (uut.state !== 3'b010) $display("FAIL: Expected state c after x=1 from b");

    x = 1; // Transition to state d
    #10;
    if (uut.state !== 3'b011) $display("FAIL: Expected state d after x=1 from c");

    // Check output y
    if (uut.y !== 1) $display("FAIL: Expected y=1 when in state d");

    // Transition back to state a
    x = 0; // Go back to state a
    #10;
    if (uut.state !== 3'b000) $display("FAIL: Expected state a after x=0 from d");
    if (uut.y !== 0) $display("FAIL: Expected y=0 when back in state a");

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule