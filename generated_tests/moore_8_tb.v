`timescale 1ns/1ps

module tb_moore;
  reg clk;
  reg rst;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  moore uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .z(z)
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

    // Apply reset
    #2 rst = 0; // Assert reset
    #10 rst = 1; // Deassert reset

    // Test sequence
    // State A (initial state)
    #10;
    if (uut.present_state !== 4'h1) $display("FAIL: Expected state A after reset");

    // Transition to state B
    x = 1; #10;
    if (uut.present_state !== 4'h2) $display("FAIL: Expected state B after x=1 from A");

    // Stay in state B
    x = 1; #10;
    if (uut.present_state !== 4'h2) $display("FAIL: Expected state B after x=1");

    // Transition to state D
    x = 0; #10;
    if (uut.present_state !== 4'h4) $display("FAIL: Expected state D after x=0 from B");

    // Stay in state D
    x = 1; #10;
    if (uut.present_state !== 4'h4) $display("FAIL: Expected state D after x=1");

    // Transition to state C
    x = 0; #10;
    if (uut.present_state !== 4'h3) $display("FAIL: Expected state C after x=0 from D");

    // Transition back to state B
    x = 0; #10;
    if (uut.present_state !== 4'h2) $display("FAIL: Expected state B after x=0 from C");

    // Transition back to state A
    x = 1; #10;
    if (uut.present_state !== 4'h1) $display("FAIL: Expected state A after x=1 from B");

    // End of test
    $display("PASS");
    $finish;
  end
endmodule