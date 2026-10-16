`timescale 1ns/1ps

module tb_bcd_segment7;

reg A, B, C, D, en;
wire [6:0] seg7;

// Instantiate the module under test
bcd_segment7 uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .en(en),
    .seg7(seg7)
);

initial begin
    // Test case 1: Enable with BCD 0 (0000)
    A = 0; B = 0; C = 0; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b1111110) $display("FAIL: Test case 1 failed for input 0");
    
    // Test case 2: Enable with BCD 1 (0001)
    A = 0; B = 0; C = 0; D = 1; en = 1;
    #10;
    if (seg7 !== 7'b0110000) $display("FAIL: Test case 2 failed for input 1");
    
    // Test case 3: Enable with BCD 2 (0010)
    A = 0; B = 0; C = 1; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b1101101) $display("FAIL: Test case 3 failed for input 2");
    
    // Test case 4: Enable with BCD 3 (0011)
    A = 0; B = 0; C = 1; D = 1; en = 1;
    #10;
    if (seg7 !== 7'b1111001) $display("FAIL: Test case 4 failed for input 3");
    
    // Test case 5: Enable with BCD 4 (0100)
    A = 0; B = 1; C = 0; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b0110011) $display("FAIL: Test case 5 failed for input 4");
    
    // Test case 6: Enable with BCD 5 (0101)
    A = 0; B = 1; C = 0; D = 1; en = 1;
    #10;
    if (seg7 !== 7'b1011011) $display("FAIL: Test case 6 failed for input 5");
    
    // Test case 7: Enable with BCD 6 (0110)
    A = 0; B = 1; C = 1; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b1011111) $display("FAIL: Test case 7 failed for input 6");
    
    // Test case 8: Enable with BCD 7 (0111)
    A = 0; B = 1; C = 1; D = 1; en = 1;
    #10;
    if (seg7 !== 7'b1110000) $display("FAIL: Test case 8 failed for input 7");
    
    // Test case 9: Enable with BCD 8 (1000)
    A = 1; B = 0; C = 0; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b1111111) $display("FAIL: Test case 9 failed for input 8");
    
    // Test case 10: Enable with BCD 9 (1001)
    A = 1; B = 0; C = 0; D = 1; en = 1;
    #10;
    if (seg7 !== 7'b1111011) $display("FAIL: Test case 10 failed for input 9");
    
    // Test case 11: Enable with BCD 10 (1010)
    A = 1; B = 0; C = 1; D = 0; en = 1;
    #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Test case 11 failed for input 10");
    
    // Test case 12: Disable
    A = 0; B = 0; C = 0; D = 0; en = 0;
    #10;
    if (seg7 !== 7'b0000000) $display("FAIL: Test case 12 failed when disabled");
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule