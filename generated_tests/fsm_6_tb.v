`timescale 1ns/1ps

module tb_fsm;

  reg IN;
  reg CLK;
  reg RST;
  wire MATCH;

  // Instantiate the module under test (uut)
  fsm uut (
    .IN(IN),
    .CLK(CLK),
    .RST(RST),
    .MATCH(MATCH)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 1;
    IN = 0;
    #10; // Wait for a clock cycle

    // Release reset
    RST = 0;
    #10;

    // Test sequence to reach state S4 and check MATCH
    IN = 0; #10; // S0
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S0");

    IN = 0; #10; // S0
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S0");

    IN = 1; #10; // S1
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S1");

    IN = 0; #10; // S2
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S2");

    IN = 1; #10; // S3
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S3");

    IN = 0; #10; // S4
    if (MATCH !== 1) $display("FAIL: Expected MATCH=1 in S4");

    IN = 1; #10; // S5
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S5");

    IN = 0; #10; // S0
    if (MATCH !== 0) $display("FAIL: Expected MATCH=0 in S0");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule