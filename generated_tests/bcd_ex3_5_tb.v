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
    // Test cases for BCD values from 0 to 9
    BCD = 4'b0000; #10; // BCD = 0
    if (EX3 !== 4'b1111) $display("FAIL: BCD=0, EX3 expected 1111, got %b", EX3);
    
    BCD = 4'b0001; #10; // BCD = 1
    if (EX3 !== 4'b1110) $display("FAIL: BCD=1, EX3 expected 1110, got %b", EX3);
    
    BCD = 4'b0010; #10; // BCD = 2
    if (EX3 !== 4'b1101) $display("FAIL: BCD=2, EX3 expected 1101, got %b", EX3);
    
    BCD = 4'b0011; #10; // BCD = 3
    if (EX3 !== 4'b1011) $display("FAIL: BCD=3, EX3 expected 1011, got %b", EX3);
    
    BCD = 4'b0100; #10; // BCD = 4
    if (EX3 !== 4'b1001) $display("FAIL: BCD=4, EX3 expected 1001, got %b", EX3);
    
    BCD = 4'b0101; #10; // BCD = 5
    if (EX3 !== 4'b0111) $display("FAIL: BCD=5, EX3 expected 0111, got %b", EX3);
    
    BCD = 4'b0110; #10; // BCD = 6
    if (EX3 !== 4'b0110) $display("FAIL: BCD=6, EX3 expected 0110, got %b", EX3);
    
    BCD = 4'b0111; #10; // BCD = 7
    if (EX3 !== 4'b0100) $display("FAIL: BCD=7, EX3 expected 0100, got %b", EX3);
    
    BCD = 4'b1000; #10; // BCD = 8
    if (EX3 !== 4'b0010) $display("FAIL: BCD=8, EX3 expected 0010, got %b", EX3);
    
    BCD = 4'b1001; #10; // BCD = 9
    if (EX3 !== 4'b0000) $display("FAIL: BCD=9, EX3 expected 0000, got %b", EX3);
    
    // Test case for BCD value greater than 9
    BCD = 4'b1010; #10; // BCD = 10
    if (EX3 !== 4'bxxxx) $display("FAIL: BCD=10, EX3 expected xxxx, got %b", EX3);
    
    BCD = 4'b1111; #10; // BCD = 15
    if (EX3 !== 4'bxxxx) $display("FAIL: BCD=15, EX3 expected xxxx, got %b", EX3);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule