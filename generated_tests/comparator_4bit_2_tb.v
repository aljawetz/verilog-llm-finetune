`timescale 1ns/1ps

module tb_comparator_4bit;

reg [3:0] a;
reg [3:0] b;
wire equal;
wire greater;
wire less;

comparator_4bit uut (
    .a(a),
    .b(b),
    .equal(equal),
    .greater(greater),
    .less(less)
);

initial begin
    // Test case 1: a = 4, b = 2 (a > b)
    a = 4; b = 2;
    #10;
    if (equal !== 0 || greater !== 1 || less !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 2, b = 4 (a < b)
    a = 2; b = 4;
    #10;
    if (equal !== 0 || greater !== 0 || less !== 1) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 3, b = 3 (a == b)
    a = 3; b = 3;
    #10;
    if (equal !== 1 || greater !== 0 || less !== 0) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 0, b = 0 (a == b)
    a = 0; b = 0;
    #10;
    if (equal !== 1 || greater !== 0 || less !== 0) 
        $display("FAIL: Test case 4 failed");
    
    // Test case 5: a = 15, b = 0 (a > b)
    a = 15; b = 0;
    #10;
    if (equal !== 0 || greater !== 1 || less !== 0) 
        $display("FAIL: Test case 5 failed");
    
    // Test case 6: a = 0, b = 15 (a < b)
    a = 0; b = 15;
    #10;
    if (equal !== 0 || greater !== 0 || less !== 1) 
        $display("FAIL: Test case 6 failed");

    $display("PASS");
    $finish;
end

endmodule