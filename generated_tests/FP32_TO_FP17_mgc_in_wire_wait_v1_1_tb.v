`timescale 1ns/1ps

module tb_FP32_TO_FP17_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP32_TO_FP17_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    z = 0;

    // Test sequence
    // Test 1: Check initial values
    #10;
    if (vd !== 0 || d !== 0 || lz !== 0) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test 2: Check output when ld is high and vz is low
    ld = 1; vz = 0; z = 8'hAA; // Set z to a known value
    #10;
    if (vd !== 0 || d !== 8'hAA || lz !== 1) begin
      $display("FAIL: Outputs incorrect when ld=1, vz=0, z=8'hAA");
      $finish;
    end

    // Test 3: Check output when ld is high and vz is high
    ld = 1; vz = 1; z = 8'h55; // Change z to another known value
    #10;
    if (vd !== 1 || d !== 8'h55 || lz !== 1) begin
      $display("FAIL: Outputs incorrect when ld=1, vz=1, z=8'h55");
      $finish;
    end

    // Test 4: Check output when ld is low
    ld = 0; vz = 1; z = 8'hFF; // Change z again
    #10;
    if (vd !== 1 || d !== 8'hFF || lz !== 0) begin
      $display("FAIL: Outputs incorrect when ld=0, vz=1, z=8'hFF");
      $finish;
    end

    // Test 5: Check output when ld is low and vz is low
    ld = 0; vz = 0; z = 8'h00; // Reset z
    #10;
    if (vd !== 0 || d !== 8'h00 || lz !== 0) begin
      $display("FAIL: Outputs incorrect when ld=0, vz=0, z=8'h00");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule