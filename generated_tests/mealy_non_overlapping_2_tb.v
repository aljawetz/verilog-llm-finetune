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
    // Initialize signals
    rst = 1;
    in = 0;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test sequence
    // State A -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1, got %h", uut.cs);

    // State B -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1, got %h", uut.cs);

    // State B -> C (in = 0)
    in = 0; #10;
    if (uut.cs !== 4'h3) $display("FAIL: Expected state C after input 0, got %h", uut.cs);

    // State C -> D (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h4) $display("FAIL: Expected state D after input 1, got %h", uut.cs);

    // State D -> A (in = 0)
    in = 0; #10;
    if (uut.cs !== 4'h1) $display("FAIL: Expected state A after input 0, got %h", uut.cs);

    // State A -> B (in = 1)
    in = 1; #10;
    if (uut.cs !== 4'h2) $display("FAIL: Expected state B after input 1, got %h", uut.cs);

    // Check output
    if (out !== 1) $display("FAIL: Expected output 1, got %b", out);

    // Reset the FSM
    rst = 1; #10;
    rst = 0; #10;

    // Check output after reset
    if (out !== 0) $display("FAIL: Expected output 0 after reset, got %b", out);

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule