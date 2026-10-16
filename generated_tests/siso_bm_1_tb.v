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
    #10; // Wait for 10ns

    // Deactivate clear
    clr = 0;
    #10;

    // Test shifting in values
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: so should be 0 after first shift");
    
    si = 0; #10; // Shift in 0
    if (so !== 1) $display("FAIL: so should be 1 after second shift");
    
    si = 1; #10; // Shift in 1
    if (so !== 0) $display("FAIL: so should be 0 after third shift");
    
    si = 1; #10; // Shift in 1
    if (so !== 1) $display("FAIL: so should be 1 after fourth shift");

    // Clear the register
    clr = 1; #10; // Activate clear
    clr = 0; #10; // Deactivate clear

    // Check if output is cleared
    si = 0; #10; // Shift in 0
    if (so !== 0) $display("FAIL: so should be 0 after clear");

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule