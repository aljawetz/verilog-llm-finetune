`timescale 1ns/1ps

module tb_FP16_TO_FP32_mgc_in_wire_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] z;

  // Outputs
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP32_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  initial begin
    // Initialize Inputs
    ld = 0;
    vz = 0;
    z = 0;

    // Wait for global reset
    #10;

    // Test case 1: Check initial values
    if (vd !== 0 || d !== 0 || lz !== 0) begin
      $display("FAIL: Initial values are not as expected");
      $finish;
    end

    // Test case 2: Set vz and z, check outputs
    vz = 1;
    z = 8'hFF; // Set z to maximum value
    #10; // Wait for a time to propagate

    if (vd !== vz || d !== z || lz !== ld) begin
      $display("FAIL: Outputs do not match expected values after setting vz and z");
      $finish;
    end

    // Test case 3: Change ld and check lz
    ld = 1;
    #10; // Wait for a time to propagate

    if (lz !== ld) begin
      $display("FAIL: lz does not match ld");
      $finish;
    end

    // Test case 4: Reset ld and check outputs again
    ld = 0;
    #10; // Wait for a time to propagate

    if (lz !== ld) begin
      $display("FAIL: lz does not match ld after reset");
      $finish;
    end

    // Test case 5: Change vz and check vd
    vz = 0;
    #10; // Wait for a time to propagate

    if (vd !== vz) begin
      $display("FAIL: vd does not match vz after change");
      $finish;
    end

    // Test case 6: Change z and check d
    z = 8'hAA; // Set z to a different value
    #10; // Wait for a time to propagate

    if (d !== z) begin
      $display("FAIL: d does not match z after change");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule