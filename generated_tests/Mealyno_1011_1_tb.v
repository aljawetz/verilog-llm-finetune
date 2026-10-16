`timescale 1ns/1ps

module tb_Mealyno_1011;
  reg w;
  reg clk;
  reg reset;
  wire z;

  // Instantiate the module under test
  Mealyno_1011 uut (
    .w(w),
    .z(z),
    .clk(clk),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    w = 0;
    reset = 0;

    // Apply reset
    #10 reset = 1; // Release reset after 10ns
    #10;

    // Test sequence
    // State A -> B (w=1)
    w = 1; #10;
    if (uut.y !== 3'b001) $display("FAIL: Expected state B after w=1 from A");

    // State B -> C (w=0)
    w = 0; #10;
    if (uut.y !== 3'b010) $display("FAIL: Expected state C after w=0 from B");

    // State C -> D (w=1)
    w = 1; #10;
    if (uut.y !== 3'b011) $display("FAIL: Expected state D after w=1 from C");

    // State D -> A (w=1), z should be 1
    w = 1; #10;
    if (uut.y !== 3'b000) $display("FAIL: Expected state A after w=1 from D");
    if (z !== 1) $display("FAIL: Expected z=1 when transitioning from D with w=1");

    // State A -> A (w=0)
    w = 0; #10;
    if (uut.y !== 3'b000) $display("FAIL: Expected state A after w=0 from A");

    // State A -> B (w=1)
    w = 1; #10;
    if (uut.y !== 3'b001) $display("FAIL: Expected state B after w=1 from A");

    // State B -> C (w=0)
    w = 0; #10;
    if (uut.y !== 3'b010) $display("FAIL: Expected state C after w=0 from B");

    // State C -> A (w=0)
    w = 0; #10;
    if (uut.y !== 3'b000) $display("FAIL: Expected state A after w=0 from C");

    // State A -> B (w=1)
    w = 1; #10;
    if (uut.y !== 3'b001) $display("FAIL: Expected state B after w=1 from A");

    // State B -> C (w=0)
    w = 0; #10;
    if (uut.y !== 3'b010) $display("FAIL: Expected state C after w=0 from B");

    // State C -> D (w=1)
    w = 1; #10;
    if (uut.y !== 3'b011) $display("FAIL: Expected state D after w=1 from C");

    // State D -> C (w=0)
    w = 0; #10;
    if (uut.y !== 3'b010) $display("FAIL: Expected state C after w=0 from D");

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule