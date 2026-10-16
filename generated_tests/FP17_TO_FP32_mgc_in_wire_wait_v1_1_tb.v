`timescale 1ns/1ps

module tb_FP17_TO_FP32_mgc_in_wire_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] z;
  wire vd;
  wire [width-1:0] d;
  wire lz;

  // Instantiate the module under test (uut)
  FP17_TO_FP32_mgc_in_wire_wait_v1 uut (
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
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 1 failed, expected d = %h, got d = %h", z, d);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test case 1 failed, expected lz = %b, got lz = %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test case 1 failed, expected vd = %b, got vd = %b", vz, vd);
      $finish;
    end

    // Test case 2: Change inputs
    ld = 0; vz = 0; z = 8'h55; // Set new inputs
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 2 failed, expected d = %h, got d = %h", z, d);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test case 2 failed, expected lz = %b, got lz = %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test case 2 failed, expected vd = %b, got vd = %b", vz, vd);
      $finish;
    end

    // Test case 3: Check with different values
    ld = 1; vz = 1; z = 8'hFF; // Set inputs
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 3 failed, expected d = %h, got d = %h", z, d);
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test case 3 failed, expected lz = %b, got lz = %b", ld, lz);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test case 3 failed, expected vd = %b, got vd = %b", vz, vd);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule