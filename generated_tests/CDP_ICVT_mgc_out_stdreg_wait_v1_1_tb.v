`timescale 1ns/1ps

module testbench;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  CDP_ICVT_mgc_out_stdreg_wait_v1 #(.width(width)) uut (
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
    d = 0;
    vz = 0;

    // Test sequence
    // Test 1: Check initial values
    #10;
    if (vd !== vz) $display("FAIL: vd should be %b but got %b", vz, vd);
    if (lz !== ld) $display("FAIL: lz should be %b but got %b", ld, lz);
    if (z !== d) $display("FAIL: z should be %b but got %b", d, z);

    // Test 2: Change input values
    ld = 1; d = 8'b10101010; vz = 1;
    #10;
    if (vd !== vz) $display("FAIL: vd should be %b but got %b", vz, vd);
    if (lz !== ld) $display("FAIL: lz should be %b but got %b", ld, lz);
    if (z !== d) $display("FAIL: z should be %b but got %b", d, z);

    // Test 3: Change input values again
    ld = 0; d = 8'b11110000; vz = 0;
    #10;
    if (vd !== vz) $display("FAIL: vd should be %b but got %b", vz, vd);
    if (lz !== ld) $display("FAIL: lz should be %b but got %b", ld, lz);
    if (z !== d) $display("FAIL: z should be %b but got %b", d, z);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule