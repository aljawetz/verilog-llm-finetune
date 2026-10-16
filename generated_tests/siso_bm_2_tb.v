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
    // Initialize signals
    si = 0;
    clr = 1; // Start with clear active
    #10; // Wait for 10ns

    // Release clear
    clr = 0;
    #10;

    // Test shifting in bits
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
    
    si = 1; #10; // Shift in 1
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);

    // Clear the register
    clr = 1; #10; // Assert clear
    if (so !== 0) $display("FAIL: Expected so=0 after clear, got so=%b", so);
    
    clr = 0; #10; // Release clear

    // Test shifting in more bits
    si = 1; #10; // Shift in 1
    si = 1; #10; // Shift in 1
    si = 0; #10; // Shift in 0
    si = 1; #10; // Shift in 1
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
    
    // Final check
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule