`timescale 1ns/1ps

module tb_FP17_TO_FP16_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  wire vd;
  reg [width-1:0] d;
  wire lz;
  reg vz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP17_TO_FP16_mgc_out_stdreg_wait_v1 uut (
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
    d = 0;

    // Test sequence
    // Test 1: Check initial state
    #10;
    if (lz !== 0 || vd !== 0 || z !== 0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test 2: Load data and check outputs
    ld = 1; vz = 1; d = 8'hAA; // Load data AA
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Output check after loading data failed");
      $finish;
    end

    // Test 3: Change data and check outputs
    d = 8'h55; // Change data to 55
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Output check after changing data failed");
      $finish;
    end

    // Test 4: Disable load and check outputs
    ld = 0; vz = 0; // Disable load and valid
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'h55) begin
      $display("FAIL: Output check after disabling load and valid failed");
      $finish;
    end

    // Test 5: Re-enable load and valid with new data
    ld = 1; vz = 1; d = 8'hFF; // Load data FF
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hFF) begin
      $display("FAIL: Output check after reloading data failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule