`timescale 1ns/1ps

module tb_n_bit_comparator;

reg [15:0] a, b;
wire lt, gt, eq;

// Instantiate the module under test (uut)
n_bit_comparator uut (
    .a(a),
    .b(b),
    .lt(lt),
    .gt(gt),
    .eq(eq)
);

initial begin
    // Test case 1: a < b
    a = 16'h0001; 
    b = 16'h0002; 
    #10;
    if (lt !== 1 || gt !== 0 || eq !== 0) 
        $display("FAIL: Test case 1 failed (a < b)");
    
    // Test case 2: a > b
    a = 16'h0003; 
    b = 16'h0002; 
    #10;
    if (lt !== 0 || gt !== 1 || eq !== 0) 
        $display("FAIL: Test case 2 failed (a > b)");

    // Test case 3: a == b
    a = 16'h0002; 
    b = 16'h0002; 
    #10;
    if (lt !== 0 || gt !== 0 || eq !== 1) 
        $display("FAIL: Test case 3 failed (a == b)");

    // Test case 4: a < b (negative numbers)
    a = 16'hFFFE; 
    b = 16'hFFFF; 
    #10;
    if (lt !== 1 || gt !== 0 || eq !== 0) 
        $display("FAIL: Test case 4 failed (a < b with negative numbers)");

    // Test case 5: a > b (negative numbers)
    a = 16'hFFFF; 
    b = 16'hFFFE; 
    #10;
    if (lt !== 0 || gt !== 1 || eq !== 0) 
        $display("FAIL: Test case 5 failed (a > b with negative numbers)");

    // Test case 6: a == b (negative numbers)
    a = 16'hFFFE; 
    b = 16'hFFFE; 
    #10;
    if (lt !== 0 || gt !== 0 || eq !== 1) 
        $display("FAIL: Test case 6 failed (a == b with negative numbers)");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule