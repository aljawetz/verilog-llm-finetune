`timescale 1ns/1ps

module tb_mealy_non_overlapping;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  mealy_non_overlapping uut (
    .out(out),
    .clk(clk),
    .rst(rst),
    .in(in)
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
    in = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test sequence
    // State A -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1 from A");

    // State B -> C (in = 0)
    in = 0; #10;
    if (uut.cs !== 4'h3) $display("FAIL: Expected state C after input 0 from B");

    // State C -> D (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h4) $display("FAIL: Expected state D after input 1 from C");

    // Check output in state D
    if (out !== 1) $display("FAIL: Output should be 1 in state D");

    // State D -> A (in = 0)
    in = 0; #10;
    if (uut.cs !== 4'h1) $display("FAIL: Expected state A after input 0 from D");

    // State A -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1 from A");

    // State B -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1 from B");

    // State B -> C (in = 0)
    in = 0; #10;
    if (uut.cs !== 4'h3) $display("FAIL: Expected state C after input 0 from B");

    // State C -> D (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h4) $display("FAIL: Expected state D after input 1 from C");

    // Check output in state D
    if (out !== 1) $display("FAIL: Output should be 1 in state D");

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule