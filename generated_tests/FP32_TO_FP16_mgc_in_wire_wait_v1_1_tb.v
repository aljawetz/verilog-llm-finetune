`timescale 1ns/1ps

module tb_FP32_TO_FP16_mgc_in_wire_wait_v1;

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
  FP32_TO_FP16_mgc_in_wire_wait_v1 uut (
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

    // Test Case 1: Check pass-through functionality
    ld = 1; vz = 1; z = 8'hAA; // Set inputs
    #10; // Wait for a time to observe outputs
    if (d !== z) begin
      $display("FAIL: Test Case 1 - d should be equal to z");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test Case 1 - lz should be equal to ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test Case 1 - vd should be equal to vz");
      $finish;
    end

    // Test Case 2: Check with different values
    ld = 0; vz = 0; z = 8'h55; // Change inputs
    #10; // Wait for a time to observe outputs
    if (d !== z) begin
      $display("FAIL: Test Case 2 - d should be equal to z");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test Case 2 - lz should be equal to ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test Case 2 - vd should be equal to vz");
      $finish;
    end

    // Test Case 3: Check with another set of values
    ld = 1; vz = 1; z = 8'hFF; // Change inputs
    #10; // Wait for a time to observe outputs
    if (d !== z) begin
      $display("FAIL: Test Case 3 - d should be equal to z");
      $finish;
    end
    if (lz !== ld) begin
      $display("FAIL: Test Case 3 - lz should be equal to ld");
      $finish;
    end
    if (vd !== vz) begin
      $display("FAIL: Test Case 3 - vd should be equal to vz");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule