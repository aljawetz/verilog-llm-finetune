`timescale 1ns/1ps

module tb_FP32_SUB_mgc_out_stdreg_wait_v1;

  parameter integer width = 8;

  reg ld;
  reg [width-1:0] d;
  reg vz;
  wire vd;
  wire lz;
  wire [width-1:0] z;

  // Instantiate the module under test (uut)
  FP32_SUB_mgc_out_stdreg_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  initial begin
    // Initialize signals
    ld = 0;
    d = 8'b00000000;
    vz = 0;

    // Test case 1: Check initial values
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'b00000000) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test case 2: Check output when ld is high
    ld = 1;
    d = 8'b10101010;
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'b10101010) begin
      $display("FAIL: Outputs are incorrect when ld is high");
      $finish;
    end

    // Test case 3: Check output when ld is low
    ld = 0;
    d = 8'b11110000;
    vz = 0;
    #10;
    if (lz !== 0 || vd !== 0 || z !== 8'b11110000) begin
      $display("FAIL: Outputs are incorrect when ld is low");
      $finish;
    end

    // Test case 4: Check output with different data
    ld = 1;
    d = 8'b00001111;
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'b00001111) begin
      $display("FAIL: Outputs are incorrect with new data");
      $finish;
    end

    // Test case 5: Check output with zero data
    ld = 1;
    d = 8'b00000000;
    vz = 1;
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'b00000000) begin
      $display("FAIL: Outputs are incorrect with zero data");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule