`timescale 1ns/1ps

module tb_FP17_SUB_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP17_SUB_mgc_in_wire_wait_v1 uut (
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
    // Test case 1: Check initial values
    #10;
    if (vd !== 0 || d !== 0 || lz !== 0) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test case 2: Check output when vz = 1 and ld = 1
    vz = 1;
    ld = 1;
    z = 8'hFF; // Set z to maximum value
    #10;
    if (vd !== 1 || d !== 8'hFF || lz !== 1) begin
      $display("FAIL: Outputs incorrect for vz=1, ld=1, z=0xFF");
      $finish;
    end

    // Test case 3: Check output when vz = 0 and ld = 0
    vz = 0;
    ld = 0;
    z = 8'hAA; // Set z to some value
    #10;
    if (vd !== 0 || d !== 8'hAA || lz !== 0) begin
      $display("FAIL: Outputs incorrect for vz=0, ld=0, z=0xAA");
      $finish;
    end

    // Test case 4: Check output when vz = 1 and ld = 0
    vz = 1;
    ld = 0;
    z = 8'h55; // Set z to another value
    #10;
    if (vd !== 1 || d !== 8'h55 || lz !== 0) begin
      $display("FAIL: Outputs incorrect for vz=1, ld=0, z=0x55");
      $finish;
    end

    // Test case 5: Check output when vz = 0 and ld = 1
    vz = 0;
    ld = 1;
    z = 8'h33; // Set z to another value
    #10;
    if (vd !== 0 || d !== 8'h33 || lz !== 1) begin
      $display("FAIL: Outputs incorrect for vz=0, ld=1, z=0x33");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule