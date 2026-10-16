`timescale 1ns/1ps

module tb_FP16_TO_FP32_mgc_out_stdreg_wait_v1;

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
  FP16_TO_FP32_mgc_out_stdreg_wait_v1 uut (
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
    d = 8'b00000000;

    // Wait for global reset
    #10;

    // Test case 1: Check passthrough functionality
    ld = 1; vz = 1; d = 8'b10101010; // Set inputs
    #10; // Wait for a time
    if (z !== d) begin
      $display("FAIL: Output z does not match input d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    // Test case 2: Check with different values
    ld = 1; vz = 0; d = 8'b11110000; // Change inputs
    #10; // Wait for a time
    if (z !== d) begin
      $display("FAIL: Output z does not match input d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    // Test case 3: Check when ld is low
    ld = 0; vz = 1; d = 8'b00001111; // Change inputs
    #10; // Wait for a time
    if (z !== d) begin
      $display("FAIL: Output z does not match input d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    // Test case 4: Check with ld low and vz low
    ld = 0; vz = 0; d = 8'b00000001; // Change inputs
    #10; // Wait for a time
    if (z !== d) begin
      $display("FAIL: Output z does not match input d");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Output lz does not match input ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Output vd does not match input vz");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule