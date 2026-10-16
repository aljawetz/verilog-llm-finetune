`timescale 1ns/1ps

module tb_FP32_MUL_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP32_MUL_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;
    vz = 0;

    // Test sequence
    // Test 1: Check output when ld is low and vz is low
    #10;
    if (lz !== 0 || vd !== 0 || z !== 0) begin
      $display("FAIL: Test 1 failed");
      $finish;
    end

    // Test 2: Check output when ld is high, vz is low, and d is non-zero
    ld = 1;
    d = 8'hAA; // 10101010
    #10;
    if (lz !== 1 || vd !== 0 || z !== d) begin
      $display("FAIL: Test 2 failed");
      $finish;
    end

    // Test 3: Check output when ld is high and vz is high
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== d) begin
      $display("FAIL: Test 3 failed");
      $finish;
    end

    // Test 4: Check output when ld is low and vz is high
    ld = 0;
    #10;
    if (lz !== 0 || vd !== 1 || z !== d) begin
      $display("FAIL: Test 4 failed");
      $finish;
    end

    // Test 5: Check output when ld is low and vz is low again
    vz = 0;
    #10;
    if (lz !== 0 || vd !== 0 || z !== d) begin
      $display("FAIL: Test 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule