`timescale 1ns/1ps

module tb_ex3_bcd;

  reg [3:0] EX3;
  wire [3:0] BCD;

  // Instantiate the module under test
  ex3_bcd uut (
    .EX3(EX3),
    .BCD(BCD)
  );

  initial begin
    // Test cases
    // Valid inputs
    EX3 = 4'b0011; // 3 in binary
    #10;
    if (BCD !== 4'b0011) $display("FAIL: Input 3 should produce BCD 0011");

    EX3 = 4'b0100; // 4 in binary
    #10;
    if (BCD !== 4'b0100) $display("FAIL: Input 4 should produce BCD 0100");

    EX3 = 4'b1000; // 8 in binary
    #10;
    if (BCD !== 4'b1000) $display("FAIL: Input 8 should produce BCD 1000");

    EX3 = 4'b1001; // 9 in binary
    #10;
    if (BCD !== 4'b1001) $display("FAIL: Input 9 should produce BCD 1001");

    EX3 = 4'b1010; // 10 in binary
    #10;
    if (BCD !== 4'b1010) $display("FAIL: Input 10 should produce BCD 1010");

    EX3 = 4'b1011; // 11 in binary
    #10;
    if (BCD !== 4'b1011) $display("FAIL: Input 11 should produce BCD 1011");

    EX3 = 4'b1100; // 12 in binary
    #10;
    if (BCD !== 4'b1100) $display("FAIL: Input 12 should produce BCD 1100");

    // Invalid inputs
    EX3 = 4'b0000; // 0 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 0 should produce undefined BCD");

    EX3 = 4'b0001; // 1 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 1 should produce undefined BCD");

    EX3 = 4'b0010; // 2 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 2 should produce undefined BCD");

    EX3 = 4'b1101; // 13 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 13 should produce undefined BCD");

    EX3 = 4'b1110; // 14 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 14 should produce undefined BCD");

    EX3 = 4'b1111; // 15 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Input 15 should produce undefined BCD");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule