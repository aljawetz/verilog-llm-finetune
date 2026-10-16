`timescale 1ns/1ps

module tb_FP32_TO_FP17_mgc_out_stdreg_wait_v1;

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
  FP32_TO_FP17_mgc_out_stdreg_wait_v1 uut (
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
    d = 8'b00000000;
    vz = 0;

    // Wait for global reset
    #10;

    // Test case 1: Load data and check outputs
    ld = 1; d = 8'b10101010; vz = 1; #10;
    if (lz !== 1'b1) begin
      $display("FAIL: lz should be 1 when ld is 1");
      $finish;
    end
    if (z !== 8'b10101010) begin
      $display("FAIL: z should match input d");
      $finish;
    end
    if (vd !== 1'b1) begin
      $display("FAIL: vd should match vz when vz is 1");
      $finish;
    end

    // Test case 2: Change input data
    d = 8'b11110000; #10;
    if (z !== 8'b11110000) begin
      $display("FAIL: z should match new input d");
      $finish;
    end

    // Test case 3: Check valid signal
    vz = 0; #10;
    if (vd !== 1'b0) begin
      $display("FAIL: vd should be 0 when vz is 0");
      $finish;
    end

    // Test case 4: Reset load signal
    ld = 0; #10;
    if (lz !== 1'b0) begin
      $display("FAIL: lz should be 0 when ld is 0");
      $finish;
    end

    // Test case 5: Final check with ld and vz both low
    ld = 0; vz = 0; #10;
    if (lz !== 1'b0 || vd !== 1'b0) begin
      $display("FAIL: lz and vd should both be 0 when ld and vz are 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule