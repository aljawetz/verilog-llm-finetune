`timescale 1ns/1ps

module tb_FP32_SUB_mgc_in_wire_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] z;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] d;

  // Instantiate the Unit Under Test (UUT)
  FP32_SUB_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Test sequence
  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    z = 8'b00000000;

    // Wait for global reset
    #10;

    // Test case 1: Check output when ld = 0, vz = 0, z = 0
    ld = 0; vz = 0; z = 8'b00000000;
    #10;
    if (vd !== 0 || lz !== 0 || d !== 8'b00000000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check output when ld = 1, vz = 1, z = 1
    ld = 1; vz = 1; z = 8'b00000001;
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'b00000001) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check output when ld = 0, vz = 1, z = 255
    ld = 0; vz = 1; z = 8'b11111111;
    #10;
    if (vd !== 1 || lz !== 0 || d !== 8'b11111111) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check output when ld = 1, vz = 0, z = 128
    ld = 1; vz = 0; z = 8'b10000000;
    #10;
    if (vd !== 0 || lz !== 1 || d !== 8'b10000000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Check output when ld = 1, vz = 1, z = 64
    ld = 1; vz = 1; z = 8'b01000000;
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'b01000000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule