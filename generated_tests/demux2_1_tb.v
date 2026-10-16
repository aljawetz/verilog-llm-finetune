`timescale 1ns/1ps

module tb_demux2;

reg din;
reg s2, s1, s0;
wire d0, d1, d2, d3, d4, d5, d6, d7;

// Instantiate the demux2 module
demux2 uut (
    .din(din),
    .s2(s2),
    .s1(s1),
    .s0(s0),
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
    // Initialize inputs
    din = 0;
    s2 = 0;
    s1 = 0;
    s0 = 0;

    // Test all combinations of select signals
    din = 1; // Set data input to 1

    // Test case 1: Select 0
    #10; s2 = 0; s1 = 0; s0 = 0;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 1 failed");
    
    // Test case 2: Select 1
    #10; s2 = 0; s1 = 0; s0 = 1;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 2 failed");
    
    // Test case 3: Select 2
    #10; s2 = 0; s1 = 1; s0 = 0;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 3 failed");
    
    // Test case 4: Select 3
    #10; s2 = 0; s1 = 1; s0 = 1;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 4 failed");
    
    // Test case 5: Select 4
    #10; s2 = 1; s1 = 0; s0 = 0;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 1 || d5 !== 0 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 5 failed");
    
    // Test case 6: Select 5
    #10; s2 = 1; s1 = 0; s0 = 1;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 1 || d6 !== 0 || d7 !== 0) 
        $display("FAIL: Test case 6 failed");
    
    // Test case 7: Select 6
    #10; s2 = 1; s1 = 1; s0 = 0;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 1 || d7 !== 0) 
        $display("FAIL: Test case 7 failed");
    
    // Test case 8: Select 7
    #10; s2 = 1; s1 = 1; s0 = 1;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0 || d5 !== 0 || d6 !== 0 || d7 !== 1) 
        $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule