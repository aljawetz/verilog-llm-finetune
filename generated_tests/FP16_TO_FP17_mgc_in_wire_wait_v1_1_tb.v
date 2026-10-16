`timescale 1ns/1ps

module tb_FP16_TO_FP17_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP16_TO_FP17_mgc_in_wire_wait_v1 #(.width(width)) uut (
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

    // Test case 1: Check pass-through functionality
    ld = 1; vz = 1; z = 8'hAA; // Set inputs
    #10; // Wait for a time period
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

    // Test case 2: Change inputs and check outputs
    ld = 0; vz = 0; z = 8'h55; // Change inputs
    #10; // Wait for a time period
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

    // Test case 3: Check with different values
    ld = 1; vz = 1; z = 8'hFF; // Set inputs
    #10; // Wait for a time period
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

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule