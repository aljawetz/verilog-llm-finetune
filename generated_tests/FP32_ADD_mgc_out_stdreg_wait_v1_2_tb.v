`timescale 1ns/1ps

module tb_FP32_ADD_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP32_ADD_mgc_out_stdreg_wait_v1 uut (
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
    // Test 1: Check pass-through functionality
    ld = 1; vz = 1; d = 8'hAA; // Set inputs
    #10; // Wait for some time
    if (z !== d) begin
      $display("FAIL: Test 1 - Output z mismatch. Expected: %h, Got: %h", d, z);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 1 - Output lz mismatch. Expected: %b, Got: %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 1 - Output vd mismatch. Expected: %b, Got: %b", vz, vd);
      $finish;
    end

    // Test 2: Change inputs
    d = 8'h55; vz = 0; // Change d and vz
    #10; // Wait for some time
    if (z !== d) begin
      $display("FAIL: Test 2 - Output z mismatch. Expected: %h, Got: %h", d, z);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 2 - Output lz mismatch. Expected: %b, Got: %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 2 - Output vd mismatch. Expected: %b, Got: %b", vz, vd);
      $finish;
    end

    // Test 3: Reset ld
    ld = 0; vz = 1; d = 8'hFF; // Change ld to 0
    #10; // Wait for some time
    if (z !== d) begin
      $display("FAIL: Test 3 - Output z mismatch. Expected: %h, Got: %h", d, z);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 3 - Output lz mismatch. Expected: %b, Got: %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 3 - Output vd mismatch. Expected: %b, Got: %b", vz, vd);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule