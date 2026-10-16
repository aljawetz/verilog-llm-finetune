`timescale 1ns/1ps

module tb_CDP_ICVT_mgc_in_wire_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] z;

  // Outputs
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the Unit Under Test (UUT)
  CDP_ICVT_mgc_in_wire_wait_v1 #(.width(width)) uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Testbench signals
  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    z = 0;

    // Test sequence
    // Test 1: Check output when ld = 0, vz = 0, z = 0
    #10;
    if (lz !== 0 || vd !== 0 || d !== 0) begin
      $display("FAIL: Test 1 failed");
      $finish;
    end

    // Test 2: Check output when ld = 1, vz = 1, z = 8'hFF
    ld = 1; vz = 1; z = 8'hFF;
    #10;
    if (lz !== 1 || vd !== 1 || d !== 8'hFF) begin
      $display("FAIL: Test 2 failed");
      $finish;
    end

    // Test 3: Check output when ld = 0, vz = 1, z = 8'hAA
    ld = 0; vz = 1; z = 8'hAA;
    #10;
    if (lz !== 0 || vd !== 1 || d !== 8'hAA) begin
      $display("FAIL: Test 3 failed");
      $finish;
    end

    // Test 4: Check output when ld = 1, vz = 0, z = 8'h55
    ld = 1; vz = 0; z = 8'h55;
    #10;
    if (lz !== 1 || vd !== 0 || d !== 8'h55) begin
      $display("FAIL: Test 4 failed");
      $finish;
    end

    // Test 5: Check output when ld = 0, vz = 0, z = 8'h00
    ld = 0; vz = 0; z = 8'h00;
    #10;
    if (lz !== 0 || vd !== 0 || d !== 8'h00) begin
      $display("FAIL: Test 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule