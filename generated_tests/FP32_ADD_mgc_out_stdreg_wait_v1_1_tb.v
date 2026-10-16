`timescale 1ns/1ps

module tb_FP32_ADD_mgc_out_stdreg_wait_v1;

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
  FP32_ADD_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;

    // Wait for global reset
    #10;

    // Test case 1: Check forwarding of data when ld and vz are low
    d = 8'hAA; // Input data
    #5;
    if (z !== d || lz !== 0 || vd !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check forwarding of data when ld is high and vz is low
    ld = 1;
    #5;
    if (z !== d || lz !== 1 || vd !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check forwarding of data when ld is low and vz is high
    ld = 0;
    vz = 1;
    #5;
    if (z !== d || lz !== 0 || vd !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check forwarding of data when both ld and vz are high
    ld = 1;
    vz = 1;
    #5;
    if (z !== d || lz !== 1 || vd !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Change input data and check outputs
    d = 8'h55; // New input data
    #5;
    if (z !== d || lz !== 1 || vd !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule