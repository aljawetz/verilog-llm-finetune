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
  wire [width-1:0] d;
  wire lz;

  // Instantiate the Unit Under Test (UUT)
  UINT16_TO_FP17_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Test sequence
  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    z = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check pass-through functionality
    ld = 1; vz = 1; z = 8'hAA; // Set inputs
    #10; // Wait for a clock cycle
    if (d !== z || lz !== ld || vd !== vz) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check with different values
    ld = 1; vz = 0; z = 8'h55; // Set inputs
    #10; // Wait for a clock cycle
    if (d !== z || lz !== ld || vd !== vz) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check ld and vz low
    ld = 0; vz = 0; z = 8'hFF; // Set inputs
    #10; // Wait for a clock cycle
    if (d !== z || lz !== ld || vd !== vz) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check ld low, vz high
    ld = 0; vz = 1; z = 8'h00; // Set inputs
    #10; // Wait for a clock cycle
    if (d !== z || lz !== ld || vd !== vz) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Check with another value
    ld = 1; vz = 1; z = 8'h7F; // Set inputs
    #10; // Wait for a clock cycle
    if (d !== z || lz !== ld || vd !== vz) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule