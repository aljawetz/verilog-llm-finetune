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
    // Test for valid inputs
    EX3 = 4'b0011; // 3 in binary
    #10;
    if (BCD !== 4'b0011) $display("FAIL: Expected BCD for 3 is 0011, got %b", BCD);

    EX3 = 4'b0100; // 4 in binary
    #10;
    if (BCD !== 4'b0100) $display("FAIL: Expected BCD for 4 is 0100, got %b", BCD);

    EX3 = 4'b0101; // 5 in binary
    #10;
    if (BCD !== 4'b0101) $display("FAIL: Expected BCD for 5 is 0101, got %b", BCD);

    EX3 = 4'b0110; // 6 in binary
    #10;
    if (BCD !== 4'b0110) $display("FAIL: Expected BCD for 6 is 0110, got %b", BCD);

    EX3 = 4'b0111; // 7 in binary
    #10;
    if (BCD !== 4'b0111) $display("FAIL: Expected BCD for 7 is 0111, got %b", BCD);

    EX3 = 4'b1000; // 8 in binary
    #10;
    if (BCD !== 4'b1000) $display("FAIL: Expected BCD for 8 is 1000, got %b", BCD);

    EX3 = 4'b1001; // 9 in binary
    #10;
    if (BCD !== 4'b1001) $display("FAIL: Expected BCD for 9 is 1001, got %b", BCD);

    EX3 = 4'b1010; // 10 in binary
    #10;
    if (BCD !== 4'b1010) $display("FAIL: Expected BCD for 10 is 1010, got %b", BCD);

    EX3 = 4'b1011; // 11 in binary
    #10;
    if (BCD !== 4'b1011) $display("FAIL: Expected BCD for 11 is 1011, got %b", BCD);

    EX3 = 4'b1100; // 12 in binary
    #10;
    if (BCD !== 4'b1100) $display("FAIL: Expected BCD for 12 is 1100, got %b", BCD);

    // Test for invalid inputs
    EX3 = 4'b0000; // 0 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 0 is xxxx, got %b", BCD);

    EX3 = 4'b0001; // 1 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 1 is xxxx, got %b", BCD);

    EX3 = 4'b0010; // 2 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 2 is xxxx, got %b", BCD);

    EX3 = 4'b1101; // 13 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 13 is xxxx, got %b", BCD);

    EX3 = 4'b1110; // 14 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 14 is xxxx, got %b", BCD);

    EX3 = 4'b1111; // 15 in binary
    #10;
    if (BCD !== 4'bxxxx) $display("FAIL: Expected BCD for 15 is xxxx, got %b", BCD);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule