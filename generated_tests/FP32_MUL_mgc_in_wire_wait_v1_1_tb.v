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
  wire [width-1:0] d;
  wire lz;

  // Instantiate the Unit Under Test (UUT)
  FP32_MUL_mgc_in_wire_wait_v1 uut (
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

    // Wait for global reset to finish
    #10;

    // Test Case 1: Check pass-through functionality
    z = 8'b10101010; // Set input z
    vz = 1;          // Set input vz
    ld = 1;          // Set load signal
    #10;             // Wait for a time

    // Assertions
    if (d !== z) begin
      $display("FAIL: d does not match z");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: lz does not match ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: vd does not match vz");
      $finish;
    end

    // Test Case 2: Check with different values
    z = 8'b11110000; // Change input z
    vz = 0;          // Change input vz
    ld = 0;          // Change load signal
    #10;             // Wait for a time

    // Assertions
    if (d !== z) begin
      $display("FAIL: d does not match z");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: lz does not match ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: vd does not match vz");
      $finish;
    end

    // Final output if all tests pass
    $display("PASS");
    $finish;
  end

endmodule