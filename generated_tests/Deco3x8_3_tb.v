`timescale 1ns/1ps

module tb_Deco3x8;

reg x, y, z, en;
wire d0, d1, d2, d3, d4, d5, d6, d7;

// Instantiate the module under test (uut)
Deco3x8 uut (
    .x(x),
    .y(y),
    .z(z),
    .en(en),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
);

initial begin
    // Test all combinations of x, y, z
    en = 1; // Enable signal (not used in logic but set to 1)
    
    // Test case 1: x=0, y=0, z=0 -> d0 should be 1
    x = 0; y = 0; z = 0; #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 1 failed");

    // Test case 2: x=0, y=0, z=1 -> d1 should be 1
    x = 0; y = 0; z = 1; #10;
    if (d1 !== 1'b1 || d0 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 2 failed");

    // Test case 3: x=0, y=1, z=0 -> d2 should be 1
    x = 0; y = 1; z = 0; #10;
    if (d2 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 3 failed");

    // Test case 4: x=0, y=1, z=1 -> d3 should be 1
    x = 0; y = 1; z = 1; #10;
    if (d3 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 4 failed");

    // Test case 5: x=1, y=0, z=0 -> d4 should be 1
    x = 1; y = 0; z = 0; #10;
    if (d4 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || 
        d3 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 5 failed");

    // Test case 6: x=1, y=0, z=1 -> d5 should be 1
    x = 1; y = 0; z = 1; #10;
    if (d5 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || 
        d3 !== 1'b0 || d4 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 6 failed");

    // Test case 7: x=1, y=1, z=0 -> d6 should be 1
    x = 1; y = 1; z = 0; #10;
    if (d6 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || 
        d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case 7 failed");

    // Test case 8: x=1, y=1, z=1 -> d7 should be 1
    x = 1; y = 1; z = 1; #10;
    if (d7 !== 1'b1 || d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || 
        d3 !== 1'b0 || d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0) 
        $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule