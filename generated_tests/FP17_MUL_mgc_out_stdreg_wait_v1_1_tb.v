`timescale 1ns/1ps

module tb_FP17_MUL_mgc_out_stdreg_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg [width-1:0] d;
  reg vz;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP17_MUL_mgc_out_stdreg_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Test procedure
  initial begin
    // Initialize inputs
    ld = 0;
    d = 0;
    vz = 0;

    // Wait for global reset
    #10;

    // Test case 1: Check pass-through functionality
    ld = 1; d = 8'hAA; vz = 1; // Set inputs
    #10; // Wait for a time to observe outputs
    if (lz !== ld) begin
      $display("FAIL: lz should be %b but got %b", ld, lz);
      $finish;
    end
    if (z !== d) begin
      $display("FAIL: z should be %h but got %h", d, z);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: vd should be %b but got %b", vz, vd);
      $finish;
    end

    // Test case 2: Check another set of values
    ld = 0; d = 8'h55; vz = 0; // Change inputs
    #10; // Wait for a time to observe outputs
    if (lz !== ld) begin
      $display("FAIL: lz should be %b but got %b", ld, lz);
      $finish;
    end
    if (z !== d) begin
      $display("FAIL: z should be %h but got %h", d, z);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: vd should be %b but got %b", vz, vd);
      $finish;
    end

    // Test case 3: Check with different values
    ld = 1; d = 8'hFF; vz = 1; // Set inputs
    #10; // Wait for a time to observe outputs
    if (lz !== ld) begin
      $display("FAIL: lz should be %b but got %b", ld, lz);
      $finish;
    end
    if (z !== d) begin
      $display("FAIL: z should be %h but got %h", d, z);
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: vd should be %b but got %b", vz, vd);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule