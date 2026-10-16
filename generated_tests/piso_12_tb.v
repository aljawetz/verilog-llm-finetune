`timescale 1ns/1ps

module tb_piso;

  reg [3:0] in;
  reg load;
  reg clk;
  reg clr;
  wire out;

  // Instantiate the module under test (uut)
  piso uut (
    .in(in),
    .load(load),
    .clk(clk),
    .clr(clr),
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
    clr = 1; load = 0; in = 4'b0000;
    #10; // Wait for 10ns
    clr = 0; // Release reset

    // Test 1: Load data into the shift register
    in = 4'b1010; load = 1; // Load 1010
    #10; // Wait for 10ns
    load = 0; // Start shifting

    // Test 2: Shift out bits
    #10; // Shift 1st bit out
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    #10; // Shift 2nd bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    #10; // Shift 3rd bit out
    if (out !== 1'b0) $display("FAIL: Expected out = 0, got %b", out);

    #10; // Shift 4th bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    // Test 3: Clear the output
    clr = 1; // Assert clear
    #10; // Wait for 10ns
    clr = 0; // Release clear
    if (out !== 1'b0) $display("FAIL: Expected out = 0 after clear, got %b", out);

    // Test 4: Load new data and shift
    in = 4'b1111; load = 1; // Load 1111
    #10; // Wait for 10ns
    load = 0; // Start shifting

    #10; // Shift 1st bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    #10; // Shift 2nd bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    #10; // Shift 3rd bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    #10; // Shift 4th bit out
    if (out !== 1'b1) $display("FAIL: Expected out = 1, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule