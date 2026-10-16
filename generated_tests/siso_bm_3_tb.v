`timescale 1ns/1ps

module tb_siso_bm;

  reg si;
  reg clk;
  reg clr;
  wire so;

  // Instantiate the module under test (uut)
  siso_bm uut (
    .si(si),
    .clk(clk),
    .clr(clr),
    .so(so)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    si = 0;
    clr = 1; // Start with clear active
    #10; // Wait for a clock cycle
    clr = 0; // Deactivate clear

    // Test 1: Shift in 4 bits
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);

    // Test 2: Clear functionality
    clr = 1; #10; // Clear the register
    if (so !== 0) $display("FAIL: Expected so=0 after clear, got so=%b", so);
    clr = 0; #10; // Deactivate clear

    // Test 3: Shift in 4 bits after clear
    si = 0; #10; // Shift in 0
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);

    // Test 4: Final state check
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule