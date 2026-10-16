`timescale 1ns/1ps

module tb_bin2bcdDigit;

  reg [0:0] MODIN;
  reg [0:0] INIT_BAR;
  reg [0:0] CLK;
  wire [3:0] Q;
  wire [0:0] MODOUT;

  // Instantiate the module under test
  bin2bcdDigit uut (
    .MODIN(MODIN),
    .INIT_BAR(INIT_BAR),
    .CLK(CLK),
    .Q(Q),
    .MODOUT(MODOUT)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    MODIN = 0;
    INIT_BAR = 0;

    // Reset the module
    #10;
    INIT_BAR = 1; // Release reset

    // Test sequence
    // Append bits and check outputs
    MODIN = 0; #10; // Q should be 0, MODOUT should be 0
    if (Q !== 4'd0 || MODOUT !== 1'b0) $display("FAIL: Initial state check failed");

    MODIN = 1; #10; // Q should be 1, MODOUT should be 0
    if (Q !== 4'd1 || MODOUT !== 1'b0) $display("FAIL: Q=1 check failed");

    MODIN = 1; #10; // Q should be 3, MODOUT should be 0
    if (Q !== 4'd3 || MODOUT !== 1'b0) $display("FAIL: Q=3 check failed");

    MODIN = 1; #10; // Q should be 7, MODOUT should be 1
    if (Q !== 4'd7 || MODOUT !== 1'b1) $display("FAIL: Q=7 check failed");

    MODIN = 1; #10; // Q should be 3, MODOUT should be 0 (wraps from 7)
    if (Q !== 4'd3 || MODOUT !== 1'b0) $display("FAIL: Wrap check failed");

    // Test wrapping behavior
    MODIN = 0; #10; // Q should be 6, MODOUT should be 1
    if (Q !== 4'd6 || MODOUT !== 1'b1) $display("FAIL: Q=6 check failed");

    MODIN = 1; #10; // Q should be 2, MODOUT should be 0
    if (Q !== 4'd2 || MODOUT !== 1'b0) $display("FAIL: Q=2 check failed");

    MODIN = 1; #10; // Q should be 5, MODOUT should be 0
    if (Q !== 4'd5 || MODOUT !== 1'b0) $display("FAIL: Q=5 check failed");

    MODIN = 1; #10; // Q should be 9, MODOUT should be 1
    if (Q !== 4'd9 || MODOUT !== 1'b1) $display("FAIL: Q=9 check failed");

    MODIN = 0; #10; // Q should be 4, MODOUT should be 0
    if (Q !== 4'd4 || MODOUT !== 1'b0) $display("FAIL: Q=4 check failed");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule