`timescale 1ns/1ps

module tb_ex3_BCD;

reg x1, x2, x3, x4;
wire b1, b2, b3, b4;
reg [3:0] expected_output;

ex3_BCD uut (
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .b1(b1),
    .b2(b2),
    .b3(b3),
    .b4(b4)
);

initial begin
    // Test case 1: Input = 3 (0011)
    x1 = 0; x2 = 0; x3 = 1; x4 = 1; 
    expected_output = 4'b1000; // b1=1, b2=0, b3=0, b4=0
    #10;
    if ({b1, b2, b3, b4} !== expected_output) 
        $display("FAIL: Test case 1 failed for input 3");

    // Test case 2: Input = 5 (0101)
    x1 = 0; x2 = 1; x3 = 0; x4 = 1; 
    expected_output = 4'b1010; // b1=0, b2=1, b3=0, b4=1
    #10;
    if ({b1, b2, b3, b4} !== expected_output) 
        $display("FAIL: Test case 2 failed for input 5");

    // Test case 3: Input = 10 (1010)
    x1 = 1; x2 = 0; x3 = 1; x4 = 0; 
    expected_output = 4'b1001; // b1=1, b2=0, b3=0, b4=1
    #10;
    if ({b1, b2, b3, b4} !== expected_output) 
        $display("FAIL: Test case 3 failed for input 10");

    // Test case 4: Input = 14 (1110)
    x1 = 1; x2 = 1; x3 = 1; x4 = 0; 
    expected_output = 4'bxxxx; // should be undefined
    #10;
    if ({b1, b2, b3, b4} === 4'bxxxx) 
        $display("FAIL: Test case 4 failed for input 14");

    // Test case 5: Input = 1 (0001)
    x1 = 0; x2 = 0; x3 = 0; x4 = 1; 
    expected_output = 4'bxxxx; // should be undefined
    #10;
    if ({b1, b2, b3, b4} === 4'bxxxx) 
        $display("FAIL: Test case 5 failed for input 1");

    // Test case 6: Input = 2 (0010)
    x1 = 0; x2 = 0; x3 = 1; x4 = 0; 
    expected_output = 4'bxxxx; // should be undefined
    #10;
    if ({b1, b2, b3, b4} === 4'bxxxx) 
        $display("FAIL: Test case 6 failed for input 2");

    // Test case 7: Input = 13 (1101)
    x1 = 1; x2 = 1; x3 = 0; x4 = 1; 
    expected_output = 4'b1000; // b1=1, b2=0, b3=0, b4=0
    #10;
    if ({b1, b2, b3, b4} !== expected_output) 
        $display("FAIL: Test case 7 failed for input 13");

    $display("PASS");
    $finish;
end

endmodule