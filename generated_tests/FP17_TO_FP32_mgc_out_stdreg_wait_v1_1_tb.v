`timescale 1ns/1ps

module tb_FP17_TO_FP32_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP17_TO_FP32_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;
    vz = 0;

    // Test sequence
    // Test 1: Check initial state
    #10;
    if (lz !== 0 || z !== 0 || vd !== 0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test 2: Check pass-through behavior
    ld = 1; d = 8'hA5; vz = 1; // Set inputs
    #10; // Wait for a time to observe outputs
    if (lz !== 1 || z !== 8'hA5 || vd !== 1) begin
      $display("FAIL: Pass-through check failed");
      $finish;
    end

    // Test 3: Check behavior with ld low
    ld = 0; d = 8'hFF; vz = 0; // Change inputs
    #10; // Wait for a time to observe outputs
    if (lz !== 0 || z !== 8'hFF || vd !== 0) begin
      $display("FAIL: ld low check failed");
      $finish;
    end

    // Test 4: Check with different values
    ld = 1; d = 8'h7E; vz = 1; // Set inputs
    #10; // Wait for a time to observe outputs
    if (lz !== 1 || z !== 8'h7E || vd !== 1) begin
      $display("FAIL: Different value check failed");
      $finish;
    end

    // Test 5: Final check with ld low and different d
    ld = 0; d = 8'h00; vz = 0; // Set inputs
    #10; // Wait for a time to observe outputs
    if (lz !== 0 || z !== 8'h00 || vd !== 0) begin
      $display("FAIL: Final check failed");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule