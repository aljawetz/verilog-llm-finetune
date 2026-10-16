`timescale 1ns/1ps

module tb_bidirectional_shift;

  reg clk;
  reg d;
  reg M;
  reg clr;
  wire [3:0] Q;

  // Instantiate the module under test (uut)
  bidirectional_shift uut (
    .clk(clk),
    .d(d),
    .M(M),
    .clr(clr),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    clr = 1;
    d = 0;
    M = 0;

    // Wait for a clock cycle
    #10;
    
    // Clear the output
    clr = 0; // Clear is now inactive
    #10;

    // Test shifting left with M = 1
    M = 1;
    d = 1; // Shift in 1
    #10;
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001, got Q = %b", Q);

    d = 0; // Shift in 0
    #10;
    if (Q !== 4'b0010) $display("FAIL: Expected Q = 0010, got Q = %b", Q);

    d = 1; // Shift in 1
    #10;
    if (Q !== 4'b0101) $display("FAIL: Expected Q = 0101, got Q = %b", Q);

    // Test shifting right with M = 0
    M = 0;
    d = 1; // Shift in 1
    #10;
    if (Q !== 4'b1010) $display("FAIL: Expected Q = 1010, got Q = %b", Q);

    d = 0; // Shift in 0
    #10;
    if (Q !== 4'b0100) $display("FAIL: Expected Q = 0100, got Q = %b", Q);

    // Test clear functionality
    clr = 1; // Activate clear
    #10;
    if (Q !== 4'b0000) $display("FAIL: Expected Q = 0000, got Q = %b", Q);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule