`timescale 1ns/1ps

module tb_FP16_TO_FP17_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP16_TO_FP17_mgc_out_stdreg_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  initial begin
    // Initialize signals
    ld = 0;
    vz = 0;
    d = 8'h00;

    // Test sequence
    // Test 1: Check pass-through functionality
    #10;
    ld = 1; vz = 1; d = 8'hA5; // Load data
    #10;
    if (lz !== 1'b1) $display("FAIL: lz should be 1 when ld is 1");
    if (vd !== 1'b1) $display("FAIL: vd should be 1 when vz is 1");
    if (z !== 8'hA5) $display("FAIL: z should be 8'hA5 when d is 8'hA5");
    
    // Test 2: Check when ld is low
    #10;
    ld = 0; vz = 1; d = 8'hFF; // Change data
    #10;
    if (lz !== 1'b0) $display("FAIL: lz should be 0 when ld is 0");
    if (vd !== 1'b1) $display("FAIL: vd should be 1 when vz is 1");
    if (z !== 8'hA5) $display("FAIL: z should still be 8'hA5 when ld is 0");

    // Test 3: Check when vz is low
    #10;
    ld = 1; vz = 0; d = 8'h7E; // Change data
    #10;
    if (lz !== 1'b1) $display("FAIL: lz should be 1 when ld is 1");
    if (vd !== 1'b0) $display("FAIL: vd should be 0 when vz is 0");
    if (z !== 8'h7E) $display("FAIL: z should be 8'h7E when d is 8'h7E");

    // Test 4: Check all signals low
    #10;
    ld = 0; vz = 0; d = 8'h00; // Reset data
    #10;
    if (lz !== 1'b0) $display("FAIL: lz should be 0 when ld is 0");
    if (vd !== 1'b0) $display("FAIL: vd should be 0 when vz is 0");
    if (z !== 8'h7E) $display("FAIL: z should still be 8'h7E when ld and vz are 0");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule