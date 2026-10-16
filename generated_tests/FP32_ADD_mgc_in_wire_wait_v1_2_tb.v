`timescale 1ns/1ps

module tb_FP32_ADD_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire lz;
  wire [width-1:0] d;

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
    // Initialize signals
    ld = 0;
    vz = 0;
    z = 0;

    // Test sequence
    // Test 1: Check pass-through functionality
    ld = 1; vz = 1; z = 8'hAA; // Set inputs
    #10; // Wait for a short time
    if (d !== 8'hAA) begin
      $display("FAIL: Output d does not match input z");
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

    // Test 2: Change inputs and check outputs
    ld = 0; vz = 0; z = 8'h55; // Change inputs
    #10; // Wait for a short time
    if (d !== 8'h55) begin
      $display("FAIL: Output d does not match input z");
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

    // Test 3: Check with different values
    ld = 1; vz = 1; z = 8'hFF; // Set inputs
    #10; // Wait for a short time
    if (d !== 8'hFF) begin
      $display("FAIL: Output d does not match input z");
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