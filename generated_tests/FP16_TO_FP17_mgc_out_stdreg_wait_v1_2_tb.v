`timescale 1ns/1ps

module tb_FP16_TO_FP17_mgc_out_stdreg_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] d;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP17_mgc_out_stdreg_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Initial block for stimulus
  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    d = 8'b00000000;

    // Wait for global reset
    #10;

    // Test case 1: Check pass-through when ld and vz are low
    ld = 0; vz = 0; d = 8'b10101010;
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'b10101010) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check pass-through when ld is high and vz is low
    ld = 1; vz = 0; d = 8'b11001100;
    #10;
    if (lz !== 1 || vd !== 0 || z !== 8'b11001100) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check pass-through when ld is low and vz is high
    ld = 0; vz = 1; d = 8'b11110000;
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'b11110000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check pass-through when ld and vz are both high
    ld = 1; vz = 1; d = 8'b00001111;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'b00001111) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule