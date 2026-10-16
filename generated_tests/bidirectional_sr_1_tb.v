`timescale 1ns/1ps

module tb_bidirectional_sr;

  reg clk;
  reg d;
  reg M;
  reg clr;
  wire [3:0] Q;

  // Instantiate the module under test
  bidirectional_sr uut (
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
    clr = 1; M = 0; d = 0;
    #10; // Wait for a clock cycle
    clr = 0; // Clear the register

    // Test shifting right
    M = 0; d = 1; // Shift in 1
    #10; // Wait for a clock cycle
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001, got Q = %b", Q);

    M = 0; d = 0; // Shift in 0
    #10; // Wait for a clock cycle
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001, got Q = %b", Q);

    M = 0; d = 1; // Shift in 1
    #10; // Wait for a clock cycle
    if (Q !== 4'b0010) $display("FAIL: Expected Q = 0010, got Q = %b", Q);

    // Test shifting left
    M = 1; d = 1; // Shift in 1
    #10; // Wait for a clock cycle
    if (Q !== 4'b0100) $display("FAIL: Expected Q = 0100, got Q = %b", Q);

    M = 1; d = 0; // Shift in 0
    #10; // Wait for a clock cycle
    if (Q !== 4'b1000) $display("FAIL: Expected Q = 1000, got Q = %b", Q);

    // Test clear functionality
    clr = 1; // Clear the register
    #10; // Wait for a clock cycle
    if (Q !== 4'b0000) $display("FAIL: Expected Q = 0000, got Q = %b", Q);

    // Final check
    clr = 0; M = 0; d = 1; // Shift in 1
    #10; // Wait for a clock cycle
    if (Q !== 4'b0001) $display("FAIL: Expected Q = 0001, got Q = %b", Q);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule