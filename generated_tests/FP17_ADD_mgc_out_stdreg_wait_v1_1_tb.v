`timescale 1ns/1ps

module tb_FP17_ADD_mgc_out_stdreg_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg [width-1:0] d;
  reg vz;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP17_ADD_mgc_out_stdreg_wait_v1 uut (
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
    d = 8'b00000000;
    vz = 0;

    // Wait for global reset
    #10;

    // Test case 1: Check output when ld and vz are low
    #5;
    if (lz !== 0 || vd !== 0 || z !== 8'b00000000) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: Check output when ld is high and vz is low
    ld = 1;
    #5;
    if (lz !== 1 || vd !== 0 || z !== 8'b00000000) begin
      $display("FAIL: ld high, vz low check failed");
      $finish;
    end

    // Test case 3: Check output when ld is high and vz is high with d = 8'b10101010
    d = 8'b10101010;
    vz = 1;
    #5;
    if (lz !== 1 || vd !== 1 || z !== 8'b10101010) begin
      $display("FAIL: ld high, vz high check failed");
      $finish;
    end

    // Test case 4: Check output when ld is low and vz is high
    ld = 0;
    #5;
    if (lz !== 0 || vd !== 1 || z !== 8'b10101010) begin
      $display("FAIL: ld low, vz high check failed");
      $finish;
    end

    // Test case 5: Check output when ld is low and vz is low
    vz = 0;
    #5;
    if (lz !== 0 || vd !== 0 || z !== 8'b10101010) begin
      $display("FAIL: ld low, vz low check failed");
      $finish;
    end

    // Test case 6: Check output with different data
    d = 8'b11110000;
    ld = 1;
    vz = 1;
    #5;
    if (lz !== 1 || vd !== 1 || z !== 8'b11110000) begin
      $display("FAIL: Check with new data failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule