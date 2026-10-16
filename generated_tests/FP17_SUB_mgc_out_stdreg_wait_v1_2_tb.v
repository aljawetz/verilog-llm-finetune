`timescale 1ns/1ps

module tb_FP17_SUB_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP17_SUB_mgc_out_stdreg_wait_v1 uut (
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
    d = 8'h00;
    vz = 0;

    // Test sequence
    // Test case 1: Check initial values
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'h00) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test case 2: Check output when ld is high
    ld = 1;
    d = 8'hAA; // Arbitrary test value
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Outputs are incorrect when ld is high");
      $finish;
    end

    // Test case 3: Check output when ld is low
    ld = 0;
    d = 8'h55; // Another arbitrary test value
    vz = 0;
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'h55) begin
      $display("FAIL: Outputs are incorrect when ld is low");
      $finish;
    end

    // Test case 4: Check output with different values
    ld = 1;
    d = 8'hFF; // Test with maximum value
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hFF) begin
      $display("FAIL: Outputs are incorrect with maximum value");
      $finish;
    end

    // Test case 5: Check output with zero value
    ld = 1;
    d = 8'h00; // Test with zero value
    vz = 0;
    #10;
    if (lz !== 1 || vd !== 0 || z !== 8'h00) begin
      $display("FAIL: Outputs are incorrect with zero value");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule