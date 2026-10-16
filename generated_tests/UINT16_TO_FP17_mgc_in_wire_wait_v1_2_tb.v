`timescale 1ns/1ps

module tb_UINT16_TO_FP17_mgc_in_wire_wait_v1;

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
  UINT16_TO_FP17_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Clock and Reset
  initial begin
    ld = 0;
    vz = 0;
    z = 0;

    // Test sequence
    #10;
    ld = 1; vz = 1; z = 8'hAA; // Set inputs
    #10;
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

    #10;
    ld = 0; vz = 0; z = 8'h55; // Change inputs
    #10;
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

    #10;
    ld = 1; vz = 1; z = 8'hFF; // Set inputs again
    #10;
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

    $display("PASS");
    $finish;
  end

endmodule