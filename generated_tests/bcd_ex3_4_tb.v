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
    // Test cases
    // Test for BCD = 0
    BCD = 4'b0000; #10;
    if (EX3 !== 4'b1111) $display("FAIL: BCD=0, EX3=%b", EX3);
    
    // Test for BCD = 1
    BCD = 4'b0001; #10;
    if (EX3 !== 4'b1110) $display("FAIL: BCD=1, EX3=%b", EX3);
    
    // Test for BCD = 2
    BCD = 4'b0010; #10;
    if (EX3 !== 4'b1100) $display("FAIL: BCD=2, EX3=%b", EX3);
    
    // Test for BCD = 3
    BCD = 4'b0011; #10;
    if (EX3 !== 4'b1001) $display("FAIL: BCD=3, EX3=%b", EX3);
    
    // Test for BCD = 4
    BCD = 4'b0100; #10;
    if (EX3 !== 4'b1000) $display("FAIL: BCD=4, EX3=%b", EX3);
    
    // Test for BCD = 5
    BCD = 4'b0101; #10;
    if (EX3 !== 4'b0111) $display("FAIL: BCD=5, EX3=%b", EX3);
    
    // Test for BCD = 6
    BCD = 4'b0110; #10;
    if (EX3 !== 4'b0110) $display("FAIL: BCD=6, EX3=%b", EX3);
    
    // Test for BCD = 7
    BCD = 4'b0111; #10;
    if (EX3 !== 4'b0101) $display("FAIL: BCD=7, EX3=%b", EX3);
    
    // Test for BCD = 8
    BCD = 4'b1000; #10;
    if (EX3 !== 4'b0100) $display("FAIL: BCD=8, EX3=%b", EX3);
    
    // Test for BCD = 9
    BCD = 4'b1001; #10;
    if (EX3 !== 4'b0011) $display("FAIL: BCD=9, EX3=%b", EX3);
    
    // Test for BCD = 10 (undefined case)
    BCD = 4'b1010; #10;
    if (EX3 !== 4'bxxxx) $display("FAIL: BCD=10, EX3=%b", EX3);
    
    // Test for BCD = 15 (undefined case)
    BCD = 4'b1111; #10;
    if (EX3 !== 4'bxxxx) $display("FAIL: BCD=15, EX3=%b", EX3);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule