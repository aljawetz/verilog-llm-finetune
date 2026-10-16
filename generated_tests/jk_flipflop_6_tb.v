`timescale 1ns/1ps

module tb_jk_flipflop;

  reg j;
  reg k;
  reg clk;
  wire qn;
  wire qnbar;

  // Instantiate the module under test (uut)
  jk_flipflop uut (
    .j(j),
    .k(k),
    .clk(clk),
    .qn(qn),
    .qnbar(qnbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    j = 0; k = 0; #10; // Hold state
    if (qn !== 0 || qnbar !== 1) $display("FAIL: Initial state incorrect");

    // Set state
    j = 1; k = 0; #10; // Set
    if (qn !== 1 || qnbar !== 0) $display("FAIL: Set state incorrect");

    // Reset state
    j = 0; k = 1; #10; // Reset
    if (qn !== 0 || qnbar !== 1) $display("FAIL: Reset state incorrect");

    // Toggle state
    j = 1; k = 1; #10; // Toggle
    if (qn !== 1 || qnbar !== 0) $display("FAIL: First toggle state incorrect");
    
    #10; // Wait for next clock
    if (qn !== 0 || qnbar !== 1) $display("FAIL: Second toggle state incorrect");

    // Check hold state
    j = 0; k = 0; #10; // Hold state
    if (qn !== 0 || qnbar !== 1) $display("FAIL: Hold state incorrect");

    // Final check for toggle
    j = 1; k = 1; #10; // Toggle again
    if (qn !== 1 || qnbar !== 0) $display("FAIL: Third toggle state incorrect");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule