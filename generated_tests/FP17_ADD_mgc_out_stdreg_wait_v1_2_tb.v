`timescale 1ns/1ps

module tb_FP17_ADD_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg vz;
  reg [width-1:0] d;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP17_ADD_mgc_out_stdreg_wait_v1 uut (
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

    // Test case 1: Check output when ld is low and vz is low
    #10;
    if (lz !== 0 || vd !== 0 || z !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check output when ld is high and vz is low
    ld = 1;
    #10;
    if (lz !== 1 || vd !== 0 || z !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check output when ld is low and vz is high
    ld = 0;
    vz = 1;
    d = 8'hAA; // Example data
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check output when ld is high and vz is high
    ld = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Change data while ld is high
    d = 8'h55; // New data
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule