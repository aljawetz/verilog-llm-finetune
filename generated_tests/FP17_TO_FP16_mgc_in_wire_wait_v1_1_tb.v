`timescale 1ns/1ps

module tb_FP17_TO_FP16_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP17_TO_FP16_mgc_in_wire_wait_v1 uut (
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
    z = 0;

    // Test sequence
    // Test case 1: Check pass-through functionality
    #10;
    z = 8'hA5; // Input data
    vz = 1;    // Valid signal
    ld = 1;    // Load signal
    #10;

    if (d !== z) begin
      $display("FAIL: Output d does not match input z");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end

    // Test case 2: Check when valid signal is low
    #10;
    vz = 0; // Invalid signal
    ld = 0; // Load signal low
    #10;

    if (d !== z) begin
      $display("FAIL: Output d should not change when ld is low");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Output vd should be 0 when vz is 0");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Output lz should be 0 when ld is 0");
      $finish;
    end

    // Test case 3: Check load signal behavior
    #10;
    ld = 1; // Load signal high
    #10;

    if (lz !== ld) begin
      $display("FAIL: Output lz should be 1 when ld is 1");
      $finish;
    end

    // Final check
    #10;
    $display("PASS");
    $finish;
  end

endmodule