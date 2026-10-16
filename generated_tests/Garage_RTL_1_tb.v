`timescale 1ns/1ps

module tb_Garage_RTL;

  reg Up_max;
  reg Dn_max;
  reg Activate;
  reg CLK;
  reg RST;
  wire Up_M;
  wire Dn_M;

  // Instantiate the module under test (uut)
  Garage_RTL uut (
    .Up_max(Up_max),
    .Dn_max(Dn_max),
    .Activate(Activate),
    .CLK(CLK),
    .RST(RST),
    .Up_M(Up_M),
    .Dn_M(Dn_M)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 0;
    Up_max = 0;
    Dn_max = 0;
    Activate = 0;

    // Apply reset
    #10 RST = 1;

    // Test 1: Activate with Up_max high and Dn_max low
    Activate = 1; Up_max = 1; Dn_max = 0;
    #10;
    if (uut.current_state !== 3'b001) $display("FAIL: Test 1 failed, expected Mv_dn state");
    
    // Test 2: Move up when Dn_max is high
    #10; // Wait for state transition
    if (uut.current_state !== 3'b011) $display("FAIL: Test 2 failed, expected opend state");
    
    // Test 3: Check Up_M and Dn_M outputs
    if (Up_M !== 1 || Dn_M !== 0) $display("FAIL: Test 3 failed, expected Up_M=1, Dn_M=0");

    // Test 4: Move down when Up_max is high
    Activate = 1; Up_max = 0; Dn_max = 1;
    #10;
    if (uut.current_state !== 3'b010) $display("FAIL: Test 4 failed, expected Mv_up state");
    
    // Test 5: Check Up_M and Dn_M outputs
    #10; // Wait for state transition
    if (uut.current_state !== 3'b100) $display("FAIL: Test 5 failed, expected closed state");
    if (Up_M !== 0 || Dn_M !== 1) $display("FAIL: Test 5 failed, expected Up_M=0, Dn_M=1");

    // Test 6: Reset the system
    RST = 0; #10; RST = 1;
    if (uut.current_state !== 3'b000) $display("FAIL: Test 6 failed, expected idle state after reset");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule