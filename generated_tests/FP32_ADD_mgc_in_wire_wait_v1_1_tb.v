`timescale 1ns/1ps

module tb_FP32_ADD_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP32_ADD_mgc_in_wire_wait_v1 uut (
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
    // Test case 1: Check output when ld = 0, vz = 0, z = 0
    #10;
    if (vd !== 0 || d !== 0 || lz !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check output when ld = 1, vz = 1, z = 8'hFF
    ld = 1;
    vz = 1;
    z = 8'hFF;
    #10;
    if (vd !== 1 || d !== 8'hFF || lz !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check output when ld = 0, vz = 0, z = 8'h00
    ld = 0;
    vz = 0;
    z = 8'h00;
    #10;
    if (vd !== 0 || d !== 8'h00 || lz !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check output when ld = 1, vz = 0, z = 8'hAA
    ld = 1;
    vz = 0;
    z = 8'hAA;
    #10;
    if (vd !== 0 || d !== 8'hAA || lz !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Check output when ld = 0, vz = 1, z = 8'h55
    ld = 0;
    vz = 1;
    z = 8'h55;
    #10;
    if (vd !== 1 || d !== 8'h55 || lz !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule