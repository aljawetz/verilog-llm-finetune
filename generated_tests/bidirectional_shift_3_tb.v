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
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    clr = 1; d = 0; M = 0; #10; // Assert clear
    clr = 0; #10; // Release clear

    // Test shifting left
    M = 1; d = 1; #10; // Shift in 1
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001, got Q = %b", Q);
    
    d = 0; #10; // Shift in 0
    if (Q !== 4'b0010) $display("FAIL: Expected Q = 0010, got Q = %b", Q);
    
    d = 1; #10; // Shift in 1
    if (Q !== 4'b0101) $display("FAIL: Expected Q = 0101, got Q = %b", Q);
    
    // Test shifting right
    M = 0; d = 1; #10; // Shift in 1
    if (Q !== 4'b1010) $display("FAIL: Expected Q = 1010, got Q = %b", Q);
    
    d = 0; #10; // Shift in 0
    if (Q !== 4'b0100) $display("FAIL: Expected Q = 0100, got Q = %b", Q);
    
    // Test clear functionality
    clr = 1; #10; // Assert clear
    if (Q !== 4'b0000) $display("FAIL: Expected Q = 0000 after clear, got Q = %b", Q);
    
    clr = 0; #10; // Release clear

    // Final checks
    M = 1; d = 1; #10; // Shift in 1
    M = 0; d = 0; #10; // Shift in 0
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001 after shifts, got Q = %b", Q);
    
    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule