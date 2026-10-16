`timescale 1ns/1ps

module tb_FP32_MUL_mgc_in_wire_wait_v1;

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
  FP32_MUL_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Clock and Reset
  initial begin
    // Initialize Inputs
    ld = 0;
    vz = 0;
    z = 0;

    // Test Sequence
    #10;
    // Test case 1: Check initial values
    if (vd !== 0 || lz !== 0 || d !== 0) begin
      $display("FAIL: Initial values are not as expected");
      $finish;
    end

    // Test case 2: Set ld and vz, check outputs
    ld = 1;
    vz = 1;
    z = 8'hAA; // Arbitrary value
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'hAA) begin
      $display("FAIL: Outputs are not as expected when ld and vz are set");
      $finish;
    end

    // Test case 3: Change vz and check outputs
    vz = 0;
    #10;
    if (vd !== 0 || lz !== 1 || d !== 8'hAA) begin
      $display("FAIL: Outputs are not as expected when vz is changed");
      $finish;
    end

    // Test case 4: Change ld and check outputs
    ld = 0;
    #10;
    if (vd !== 0 || lz !== 0 || d !== 8'hAA) begin
      $display("FAIL: Outputs are not as expected when ld is changed");
      $finish;
    end

    // Test case 5: Change z and check outputs
    z = 8'h55; // New arbitrary value
    ld = 1; vz = 1;
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'h55) begin
      $display("FAIL: Outputs are not as expected after changing z");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule