`timescale 1ns/1ps

module tb_FP32_TO_FP16_mgc_in_wire_wait_v1;

  // Parameters
  parameter integer width = 8;

  // Inputs
  reg ld;
  reg vz;
  reg [width-1:0] z;

  // Outputs
  wire vd;
  wire lz;
  wire [width-1:0] d;

  // Instantiate the Unit Under Test (UUT)
  FP32_TO_FP16_mgc_in_wire_wait_v1 uut (
    .ld(ld),
    .vd(vd),
    .d(d),
    .lz(lz),
    .vz(vz),
    .z(z)
  );

  // Clock and Reset (not used in this module, but included for completeness)
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    ld = 0;
    vz = 0;
    z = 8'b00000000;

    // Test Case 1: Check initial values
    #10;
    if (d !== 8'b00000000 || lz !== 0 || vd !== 0) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test Case 2: Check output when ld is high
    z = 8'b10101010; // Test data
    ld = 1; // Enable ld
    #10;
    if (d !== 8'b10101010 || lz !== 1 || vd !== 0) begin
      $display("FAIL: Outputs incorrect when ld is high");
      $finish;
    end

    // Test Case 3: Check output when vz is high
    vz = 1; // Enable vz
    #10;
    if (d !== 8'b10101010 || lz !== 1 || vd !== 1) begin
      $display("FAIL: Outputs incorrect when vz is high");
      $finish;
    end

    // Test Case 4: Check output when ld goes low
    ld = 0; // Disable ld
    #10;
    if (d !== 8'b10101010 || lz !== 0 || vd !== 1) begin
      $display("FAIL: Outputs incorrect when ld is low");
      $finish;
    end

    // Test Case 5: Change z and check outputs
    z = 8'b11110000; // New test data
    #10;
    if (d !== 8'b11110000 || lz !== 0 || vd !== 1) begin
      $display("FAIL: Outputs incorrect after changing z");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule