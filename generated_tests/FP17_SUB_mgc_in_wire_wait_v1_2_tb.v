`timescale 1ns/1ps

module tb_FP17_SUB_mgc_in_wire_wait_v1;

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
  FP17_SUB_mgc_in_wire_wait_v1 uut (
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
    z = 8'b00000000;

    // Wait for global reset to finish
    #10;

    // Test Case 1: Check pass-through functionality
    ld = 1; vz = 1; z = 8'b10101010; // Set inputs
    #10; // Wait for a time to observe outputs
    if (d !== 8'b10101010) begin
      $display("FAIL: Test Case 1 - d output mismatch");
      $finish;
    end
    if (lz !== 1) begin
      $display("FAIL: Test Case 1 - lz output mismatch");
      $finish;
    end
    if (vd !== 1) begin
      $display("FAIL: Test Case 1 - vd output mismatch");
      $finish;
    end

    // Test Case 2: Check with different values
    ld = 1; vz = 0; z = 8'b11110000; // Set inputs
    #10; // Wait for a time to observe outputs
    if (d !== 8'b11110000) begin
      $display("FAIL: Test Case 2 - d output mismatch");
      $finish;
    end
    if (lz !== 1) begin
      $display("FAIL: Test Case 2 - lz output mismatch");
      $finish;
    end
    if (vd !== 0) begin
      $display("FAIL: Test Case 2 - vd output mismatch");
      $finish;
    end

    // Test Case 3: Check with ld low
    ld = 0; vz = 1; z = 8'b00001111; // Set inputs
    #10; // Wait for a time to observe outputs
    if (d !== 8'b00001111) begin
      $display("FAIL: Test Case 3 - d output mismatch");
      $finish;
    end
    if (lz !== 0) begin
      $display("FAIL: Test Case 3 - lz output mismatch");
      $finish;
    end
    if (vd !== 1) begin
      $display("FAIL: Test Case 3 - vd output mismatch");
      $finish;
    end

    // Test Case 4: Check with all zeros
    ld = 1; vz = 0; z = 8'b00000000; // Set inputs
    #10; // Wait for a time to observe outputs
    if (d !== 8'b00000000) begin
      $display("FAIL: Test Case 4 - d output mismatch");
      $finish;
    end
    if (lz !== 1) begin
      $display("FAIL: Test Case 4 - lz output mismatch");
      $finish;
    end
    if (vd !== 0) begin
      $display("FAIL: Test Case 4 - vd output mismatch");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule