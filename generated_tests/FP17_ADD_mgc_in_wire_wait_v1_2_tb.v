`timescale 1ns/1ps

module tb_FP17_ADD_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire lz;
  wire [width-1:0] d;

  // Instantiate the module under test (uut)
  FP17_ADD_mgc_in_wire_wait_v1 uut (
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
    // Test 1: Check output when ld is low and vz is low
    #10;
    if (lz !== 0 || vd !== 0 || d !== 0) begin
      $display("FAIL: Test 1 failed");
      $finish;
    end

    // Test 2: Check output when ld is high and vz is low
    ld = 1;
    #10;
    if (lz !== 1 || vd !== 0 || d !== 0) begin
      $display("FAIL: Test 2 failed");
      $finish;
    end

    // Test 3: Check output when ld is high and vz is high with z = 8'hFF
    vz = 1;
    z = 8'hFF;
    #10;
    if (lz !== 1 || vd !== 1 || d !== 8'hFF) begin
      $display("FAIL: Test 3 failed");
      $finish;
    end

    // Test 4: Check output when ld is low and vz is high
    ld = 0;
    #10;
    if (lz !== 0 || vd !== 1 || d !== 8'hFF) begin
      $display("FAIL: Test 4 failed");
      $finish;
    end

    // Test 5: Check output when ld is high and vz is low again
    ld = 1;
    vz = 0;
    #10;
    if (lz !== 1 || vd !== 0 || d !== 8'hFF) begin
      $display("FAIL: Test 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule