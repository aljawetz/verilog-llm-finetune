`timescale 1ns/1ps

module tb_ex3_bcd;

  reg [3:0] EX3;
  wire [3:0] BCD;

  // Instantiate the module under test (uut)
  ex3_bcd uut (
    .EX3(EX3),
    .BCD(BCD)
  );

  initial begin
    // Test cases
    // Test case 1: EX3 = 3
    EX3 = 4'b0011; #10;
    if (BCD !== 4'b0001) $display("FAIL: EX3=3, expected BCD=0001, got BCD=%b", BCD);

    // Test case 2: EX3 = 4
    EX3 = 4'b0100; #10;
    if (BCD !== 4'b0010) $display("FAIL: EX3=4, expected BCD=0010, got BCD=%b", BCD);

    // Test case 3: EX3 = 5
    EX3 = 4'b0101; #10;
    if (BCD !== 4'b0011) $display("FAIL: EX3=5, expected BCD=0011, got BCD=%b", BCD);

    // Test case 4: EX3 = 6
    EX3 = 4'b0110; #10;
    if (BCD !== 4'b0100) $display("FAIL: EX3=6, expected BCD=0100, got BCD=%b", BCD);

    // Test case 5: EX3 = 7
    EX3 = 4'b0111; #10;
    if (BCD !== 4'b0101) $display("FAIL: EX3=7, expected BCD=0101, got BCD=%b", BCD);

    // Test case 6: EX3 = 8
    EX3 = 4'b1000; #10;
    if (BCD !== 4'b0110) $display("FAIL: EX3=8, expected BCD=0110, got BCD=%b", BCD);

    // Test case 7: EX3 = 9
    EX3 = 4'b1001; #10;
    if (BCD !== 4'b0111) $display("FAIL: EX3=9, expected BCD=0111, got BCD=%b", BCD);

    // Test case 8: EX3 = 10
    EX3 = 4'b1010; #10;
    if (BCD !== 4'b1000) $display("FAIL: EX3=10, expected BCD=1000, got BCD=%b", BCD);

    // Test case 9: EX3 = 11
    EX3 = 4'b1011; #10;
    if (BCD !== 4'b1001) $display("FAIL: EX3=11, expected BCD=1001, got BCD=%b", BCD);

    // Test case 10: EX3 = 12
    EX3 = 4'b1100; #10;
    if (BCD !== 4'b1010) $display("FAIL: EX3=12, expected BCD=1010, got BCD=%b", BCD);

    // Test case 11: EX3 = 0
    EX3 = 4'b0000; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=0, expected BCD=xxxx, got BCD=%b", BCD);

    // Test case 12: EX3 = 1
    EX3 = 4'b0001; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=1, expected BCD=xxxx, got BCD=%b", BCD);

    // Test case 13: EX3 = 2
    EX3 = 4'b0010; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=2, expected BCD=xxxx, got BCD=%b", BCD);

    // Test case 14: EX3 = 13
    EX3 = 4'b1101; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=13, expected BCD=xxxx, got BCD=%b", BCD);

    // Test case 15: EX3 = 14
    EX3 = 4'b1110; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=14, expected BCD=xxxx, got BCD=%b", BCD);

    // Test case 16: EX3 = 15
    EX3 = 4'b1111; #10;
    if (BCD !== 4'bxxxx) $display("FAIL: EX3=15, expected BCD=xxxx, got BCD=%b", BCD);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule