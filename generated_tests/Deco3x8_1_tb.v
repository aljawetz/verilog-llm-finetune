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
    // Test all combinations of x, y, z with enable
    en = 1; // Enable the decoder
    // Test case: 000
    x = 0; y = 0; z = 0; #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 000 failed");
    
    // Test case: 001
    x = 0; y = 0; z = 1; #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 001 failed");
    
    // Test case: 010
    x = 0; y = 1; z = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 010 failed");
    
    // Test case: 011
    x = 0; y = 1; z = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 011 failed");
    
    // Test case: 100
    x = 1; y = 0; z = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 1 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 100 failed");
    
    // Test case: 101
    x = 1; y = 0; z = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 1 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 101 failed");
    
    // Test case: 110
    x = 1; y = 1; z = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 1 || d7 !== 0) 
        $display("FAIL: Test case 110 failed");
    
    // Test case: 111
    x = 1; y = 1; z = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 1) 
        $display("FAIL: Test case 111 failed");
    
    // Disable the decoder
    en = 0; 
    x = 0; y = 0; z = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Disable test failed");

    $display("PASS");
    $finish;
end

endmodule