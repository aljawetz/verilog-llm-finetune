`timescale 1ns/1ps

module tb_UINT16_TO_FP17_mgc_out_stdreg_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] d;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  UINT16_TO_FP17_mgc_out_stdreg_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Clock and reset generation
  initial begin
    ld = 0;
    vz = 0;
    d = 0;

    // Test sequence
    #10; // Wait for 10ns

    // Test 1: Check output when ld is high
    ld = 1; d = 8'hAA; vz = 0; // Load data
    #5; // Wait for 5ns
    if (lz !== 1'b1) begin
      $display("FAIL: lz should be 1 when ld is high");
      $finish;
    end
    if (z !== d) begin
      $display("FAIL: z should equal d when ld is high");
      $finish;
    end

    // Test 2: Check output when vz is high
    ld = 0; vz = 1; d = 8'h55; // Change data
    #5; // Wait for 5ns
    if (vd !== 1'b1) begin
      $display("FAIL: vd should be 1 when vz is high");
      $finish;
    end
    if (z !== 8'h55) begin
      $display("FAIL: z should equal d when vz is high");
      $finish;
    end

    // Test 3: Check output when both ld and vz are low
    ld = 0; vz = 0; d = 8'hFF; // Change data
    #5; // Wait for 5ns
    if (lz !== 1'b0) begin
      $display("FAIL: lz should be 0 when ld is low");
      $finish;
    end
    if (vd !== 1'b0) begin
      $display("FAIL: vd should be 0 when vz is low");
      $finish;
    end
    if (z !== 8'hFF) begin
      $display("FAIL: z should equal d when both ld and vz are low");
      $finish;
    end

    // Test 4: Check output when ld is low and vz is high
    ld = 0; vz = 1; d = 8'h12; // Change data
    #5; // Wait for 5ns
    if (lz !== 1'b0) begin
      $display("FAIL: lz should be 0 when ld is low");
      $finish;
    end
    if (vd !== 1'b1) begin
      $display("FAIL: vd should be 1 when vz is high");
      $finish;
    end
    if (z !== 8'h12) begin
      $display("FAIL: z should equal d when vz is high");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule