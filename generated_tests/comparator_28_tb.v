`timescale 1ns/1ps

module tb_comparator;

reg [1:0] a, b;
wire equal, greater, less;

comparator uut (
    .equal(equal),
    .greater(greater),
    .less(less),
    .a(a),
    .b(b)
);

initial begin
    // Test case 1: a = 00, b = 00
    a = 2'b00; b = 2'b00;
    #10;
    if (equal !== 1'b1 || greater !== 1'b0 || less !== 1'b0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 01, b = 00
    a = 2'b01; b = 2'b00;
    #10;
    if (equal !== 1'b0 || greater !== 1'b1 || less !== 1'b0) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 00, b = 01
    a = 2'b00; b = 2'b01;
    #10;
    if (equal !== 1'b0 || greater !== 1'b0 || less !== 1'b1) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 10, b = 10
    a = 2'b10; b = 2'b10;
    #10;
    if (equal !== 1'b1 || greater !== 1'b0 || less !== 1'b0) 
        $display("FAIL: Test case 4 failed");
    
    // Test case 5: a = 11, b = 10
    a = 2'b11; b = 2'b10;
    #10;
    if (equal !== 1'b0 || greater !== 1'b1 || less !== 1'b0) 
        $display("FAIL: Test case 5 failed");
    
    // Test case 6: a = 10, b = 11
    a = 2'b10; b = 2'b11;
    #10;
    if (equal !== 1'b0 || greater !== 1'b0 || less !== 1'b1) 
        $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule