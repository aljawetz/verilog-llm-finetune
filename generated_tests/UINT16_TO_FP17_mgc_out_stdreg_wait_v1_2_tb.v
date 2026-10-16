`timescale 1ns/1ps

module tb_UINT16_TO_FP17_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  UINT16_TO_FP17_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;

    // Test sequence
    // Test case 1: Check pass-through functionality
    d = 8'hAA; // Input data
    vz = 1;    // Valid signal
    ld = 1;    // Load signal
    #10;       // Wait for some time

    if (z !== d) begin
      $display("FAIL: Output z does not match input d");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    // Test case 2: Check when ld is low
    ld = 0; // Load signal low
    #10;    // Wait for some time

    if (z !== d) begin
      $display("FAIL: Output z should still match input d when ld is low");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Output lz should match input ld when ld is low");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Output vd should match input vz when ld is low");
      $finish;
    end

    // Test case 3: Change input data and valid signal
    d = 8'h55; // New input data
    vz = 0;    // Valid signal low
    ld = 1;    // Load signal high
    #10;       // Wait for some time

    if (z !== d) begin
      $display("FAIL: Output z does not match new input d");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Output lz does not match new input ld");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Output vd does not match new input vz");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule