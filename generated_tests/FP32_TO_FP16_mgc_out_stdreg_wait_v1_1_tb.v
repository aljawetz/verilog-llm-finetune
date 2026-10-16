`timescale 1ns/1ps

module testbench;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test
  FP32_TO_FP16_mgc_out_stdreg_wait_v1 uut (
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
    if (lz !== 0 || vd !== 0 || z !== 0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test 2: Load data and check outputs
    ld = 1; d = 8'hAA; vz = 1; // Load data and set valid
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Output check after loading data failed");
      $finish;
    end

    // Test 3: Change data and check outputs
    d = 8'h55; // Change data
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Output check after changing data failed");
      $finish;
    end

    // Test 4: Disable load and check outputs
    ld = 0; // Disable load
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Output check after disabling load failed");
      $finish;
    end

    // Test 5: Change valid signal
    vz = 0; // Set valid to 0
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'h55) begin
      $display("FAIL: Output check after setting valid to 0 failed");
      $finish;
    end

    // Test 6: Reset valid and load new data
    vz = 1; ld = 1; d = 8'hFF; // Load new data
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hFF) begin
      $display("FAIL: Output check after loading new data failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule