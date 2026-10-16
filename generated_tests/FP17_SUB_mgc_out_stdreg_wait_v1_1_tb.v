`timescale 1ns/1ps

module tb_FP17_SUB_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP17_SUB_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;
    vz = 0;

    // Test sequence
    // Test 1: Check output when ld is low
    #10;
    d = 8'hAA; // Input data
    vz = 1;    // Valid signal
    ld = 0;    // Load signal low
    #10;
    if (z !== 8'hAA || lz !== 0 || vd !== 1) begin
      $display("FAIL: Test 1 failed when ld is low");
      $finish;
    end

    // Test 2: Check output when ld is high
    #10;
    ld = 1;    // Load signal high
    #10;
    if (z !== 8'hAA || lz !== 1 || vd !== 1) begin
      $display("FAIL: Test 2 failed when ld is high");
      $finish;
    end

    // Test 3: Change input data and valid signal
    #10;
    d = 8'h55; // New input data
    vz = 0;    // Valid signal low
    #10;
    if (z !== 8'h55 || lz !== 1 || vd !== 0) begin
      $display("FAIL: Test 3 failed with new input data and vz low");
      $finish;
    end

    // Test 4: Check output with valid signal high
    #10;
    vz = 1;    // Valid signal high
    #10;
    if (z !== 8'h55 || lz !== 1 || vd !== 1) begin
      $display("FAIL: Test 4 failed with valid signal high");
      $finish;
    end

    // Test 5: Check output with ld low again
    #10;
    ld = 0;    // Load signal low
    #10;
    if (z !== 8'h55 || lz !== 0 || vd !== 1) begin
      $display("FAIL: Test 5 failed when ld is low again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule