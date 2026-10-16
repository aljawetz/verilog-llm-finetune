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
  CDP_OCVT_mgc_out_stdreg_wait_v1 uut (
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
    d = 8'h00;
    vz = 0;

    // Test case 1: Check output when ld is low
    #10;
    d = 8'hAA; // Input data
    vz = 1;    // vz is high
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check output when ld is high
    #10;
    ld = 1; // Load signal is high
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'hAA) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Change input data and check outputs
    #10;
    d = 8'h55; // New input data
    #10;
    if (lz !== 1 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check output when vz is low
    #10;
    vz = 0; // vz is low
    #10;
    if (lz !== 1 || vd !== 0 || z !== 8'h55) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset ld and vz
    #10;
    ld = 0; // Reset ld
    vz = 1; // vz is high again
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'h55) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Final check with ld low and new data
    #10;
    d = 8'hFF; // Change input data
    #10;
    if (lz !== 0 || vd !== 1 || z !== 8'hFF) begin
      $display("FAIL: Final check failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule