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
    // Test 1: Check pass-through functionality
    ld = 1; d = 8'hAA; vz = 1; #10;
    if (z !== d) begin
      $display("FAIL: Test 1 - z should equal d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 1 - lz should equal ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 1 - vd should equal vz");
      $finish;
    end

    // Test 2: Check with different values
    ld = 1; d = 8'h55; vz = 0; #10;
    if (z !== d) begin
      $display("FAIL: Test 2 - z should equal d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 2 - lz should equal ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 2 - vd should equal vz");
      $finish;
    end

    // Test 3: Check with ld = 0
    ld = 0; d = 8'hFF; vz = 1; #10;
    if (z !== d) begin
      $display("FAIL: Test 3 - z should equal d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 3 - lz should equal ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 3 - vd should equal vz");
      $finish;
    end

    // Test 4: Check with ld = 1 and different values
    ld = 1; d = 8'h1C; vz = 0; #10;
    if (z !== d) begin
      $display("FAIL: Test 4 - z should equal d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test 4 - lz should equal ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test 4 - vd should equal vz");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule