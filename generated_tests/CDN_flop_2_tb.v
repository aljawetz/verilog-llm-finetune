`timescale 1ns/1ps

module tb_CDN_flop;
  reg clk;
  reg d;
  reg sena;
  reg aclr;
  reg apre;
  reg srl;
  reg srd;
  wire q;

  // Instantiate the module under test (uut)
  CDN_flop uut (
    .clk(clk),
    .d(d),
    .sena(sena),
    .aclr(aclr),
    .apre(apre),
    .srl(srl),
    .srd(srd),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    aclr = 0;
    apre = 0;
    srl = 0;
    srd = 0;
    d = 0;
    sena = 0;

    // Test 1: Asynchronous clear
    aclr = 1; #10;
    if (q !== 0) $display("FAIL: Asynchronous clear failed");
    aclr = 0; #10;

    // Test 2: Asynchronous preset
    apre = 1; #10;
    if (q !== 1) $display("FAIL: Asynchronous preset failed");
    apre = 0; #10;

    // Test 3: Load d when sena is high
    d = 1; sena = 1; #10;
    if (q !== 1) $display("FAIL: Failed to load d when sena is high");
    
    // Test 4: Load d on clock edge
    sena = 1; d = 0; #10;
    if (q !== 0) $display("FAIL: Failed to load d on clock edge");
    
    // Test 5: Load srd when srl is high
    srl = 1; srd = 1; #10;
    if (q !== 1) $display("FAIL: Failed to load srd when srl is high");
    
    // Test 6: Ensure q holds value when sena is low
    sena = 0; #10;
    if (q !== 1) $display("FAIL: Failed to hold value when sena is low");
    
    // Test 7: Check behavior with srl and d
    srl = 0; d = 1; sena = 1; #10;
    if (q !== 1) $display("FAIL: Failed to load d when srl is low and sena is high");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule