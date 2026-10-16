`timescale 1ns/1ps

module tb_moore;
  reg clk;
  reg rst;
  reg x;
  wire z;

  // Instantiate the module under test
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
    #3 rst = 0; // Assert reset
    #10 rst = 1; // Deassert reset

    // Test sequence
    // State A -> B
    x = 1; #10;
    if (uut.present_state !== 4'h2) $display("FAIL: Expected state B after x=1 from A");

    // State B -> D
    x = 0; #10;
    if (uut.present_state !== 4'h4) $display("FAIL: Expected state D after x=0 from B");

    // State D -> C
    x = 0; #10;
    if (uut.present_state !== 4'h3) $display("FAIL: Expected state C after x=0 from D");

    // State C -> A
    x = 1; #10;
    if (uut.present_state !== 4'h1) $display("FAIL: Expected state A after x=1 from C");

    // State A -> A
    x = 0; #10;
    if (uut.present_state !== 4'h1) $display("FAIL: Expected state A after x=0 from A");

    // State A -> B
    x = 1; #10;
    if (uut.present_state !== 4'h2) $display("FAIL: Expected state B after x=1 from A");

    // Check output z when in state D
    x = 0; #10;
    if (z !== 1) $display("FAIL: Expected z=1 when in state D");

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule