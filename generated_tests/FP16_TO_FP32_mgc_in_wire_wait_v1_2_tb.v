`timescale 1ns/1ps

module tb_FP16_TO_FP32_mgc_in_wire_wait_v1;

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
  FP16_TO_FP32_mgc_in_wire_wait_v1 uut (
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

    // Test case 1: Check initial values
    #10;
    if (vd !== 0 || lz !== 0 || d !== 0) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test case 2: Check output when ld is high and vz is high
    ld = 1;
    vz = 1;
    z = 8'hFF; // Example value
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'hFF) begin
      $display("FAIL: Outputs are incorrect when ld=1 and vz=1");
      $finish;
    end

    // Test case 3: Check output when ld is low and vz is low
    ld = 0;
    vz = 0;
    z = 8'h00; // Example value
    #10;
    if (vd !== 0 || lz !== 0 || d !== 8'h00) begin
      $display("FAIL: Outputs are incorrect when ld=0 and vz=0");
      $finish;
    end

    // Test case 4: Check output with different z values
    ld = 1;
    vz = 1;
    z = 8'hA5; // Example value
    #10;
    if (vd !== 1 || lz !== 1 || d !== 8'hA5) begin
      $display("FAIL: Outputs are incorrect with z=8'hA5");
      $finish;
    end

    // Test case 5: Check output with ld low and vz high
    ld = 0;
    vz = 1;
    z = 8'h7E; // Example value
    #10;
    if (vd !== 1 || lz !== 0 || d !== 8'h7E) begin
      $display("FAIL: Outputs are incorrect with ld=0 and vz=1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule