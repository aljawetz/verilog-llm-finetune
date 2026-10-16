`timescale 1ns/1ps

module tb_bcd_ex3;

  reg [3:0] BCD;
  wire [3:0] EX3;

  // Instantiate the module under test (uut)
  bcd_ex3 uut (
    .BCD(BCD),
    .EX3(EX3)
  );

  initial begin
    // Test case 1: BCD = 0
    BCD = 4'b0000; #10;
    if (EX3 !== 4'b1111) $display("FAIL: Expected EX3 = 1111 for BCD = 0000, got EX3 = %b", EX3);

    // Test case 2: BCD = 1
    BCD = 4'b0001; #10;
    if (EX3 !== 4'b1110) $display("FAIL: Expected EX3 = 1110 for BCD = 0001, got EX3 = %b", EX3);

    // Test case 3: BCD = 2
    BCD = 4'b0010; #10;
    if (EX3 !== 4'b1101) $display("FAIL: Expected EX3 = 1101 for BCD = 0010, got EX3 = %b", EX3);

    // Test case 4: BCD = 3
    BCD = 4'b0011; #10;
    if (EX3 !== 4'b1100) $display("FAIL: Expected EX3 = 1100 for BCD = 0011, got EX3 = %b", EX3);

    // Test case 5: BCD = 4
    BCD = 4'b0100; #10;
    if (EX3 !== 4'b1011) $display("FAIL: Expected EX3 = 1011 for BCD = 0100, got EX3 = %b", EX3);

    // Test case 6: BCD = 5
    BCD = 4'b0101; #10;
    if (EX3 !== 4'b1010) $display("FAIL: Expected EX3 = 1010 for BCD = 0101, got EX3 = %b", EX3);

    // Test case 7: BCD = 6
    BCD = 4'b0110; #10;
    if (EX3 !== 4'b1001) $display("FAIL: Expected EX3 = 1001 for BCD = 0110, got EX3 = %b", EX3);

    // Test case 8: BCD = 7
    BCD = 4'b0111; #10;
    if (EX3 !== 4'b1000) $display("FAIL: Expected EX3 = 1000 for BCD = 0111, got EX3 = %b", EX3);

    // Test case 9: BCD = 8
    BCD = 4'b1000; #10;
    if (EX3 !== 4'b0111) $display("FAIL: Expected EX3 = 0111 for BCD = 1000, got EX3 = %b", EX3);

    // Test case 10: BCD = 9
    BCD = 4'b1001; #10;
    if (EX3 !== 4'b0110) $display("FAIL: Expected EX3 = 0110 for BCD = 1001, got EX3 = %b", EX3);

    // Test case 11: BCD = 10 (invalid BCD)
    BCD = 4'b1010; #10;
    if (EX3 !== 4'bxxxx) $display("FAIL: Expected EX3 = xxxx for BCD = 1010, got EX3 = %b", EX3);

    // Test case 12: BCD = 15 (invalid BCD)
    BCD = 4'b1111; #10;
    if (EX3 !== 4'bxxxx) $display("FAIL: Expected EX3 = xxxx for BCD = 1111, got EX3 = %b", EX3);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule