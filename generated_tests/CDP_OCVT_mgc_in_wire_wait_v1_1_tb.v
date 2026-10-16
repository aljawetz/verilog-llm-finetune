`timescale 1ns/1ps

module tb_CDP_OCVT_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire lz;
  wire [width-1:0] d;

  // Instantiate the module under test (uut)
  CDP_OCVT_mgc_in_wire_wait_v1 uut (
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
    // Test 1: Check pass-through functionality
    z = 8'hAA; // Input value
    vz = 1;    // Valid signal
    ld = 1;    // Load signal
    #10;       // Wait for some time

    if (d !== z) begin
      $display("FAIL: Test 1 - d should be equal to z");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Test 1 - lz should be equal to ld");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Test 1 - vd should be equal to vz");
      $finish;
    end

    // Test 2: Change input values
    z = 8'h55; // New input value
    vz = 0;    // Valid signal low
    ld = 0;    // Load signal low
    #10;       // Wait for some time

    if (d !== z) begin
      $display("FAIL: Test 2 - d should be equal to z");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Test 2 - lz should be equal to ld");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Test 2 - vd should be equal to vz");
      $finish;
    end

    // Test 3: Check when ld is low
    ld = 0;    // Load signal low
    vz = 1;    // Valid signal high
    #10;       // Wait for some time

    if (d !== z) begin
      $display("FAIL: Test 3 - d should be equal to z");
      $finish;
    end

    if (lz !== ld) begin
      $display("FAIL: Test 3 - lz should be equal to ld");
      $finish;
    end

    if (vd !== vz) begin
      $display("FAIL: Test 3 - vd should be equal to vz");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule