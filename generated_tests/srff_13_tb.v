`timescale 1ns/1ps

module tb_srff;

reg s;
reg r;
reg clk;
reg rst;
wire q;
wire qb;

// Instantiate the SR flip-flop
srff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qb(qb)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1; s = 0; r = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test 1: Hold state
    #10; // Check initial state
    if (q !== 0) $display("FAIL: Initial state should be 0 after reset");

    // Test 2: Set state
    s = 1; r = 0; 
    #10;
    if (q !== 1) $display("FAIL: q should be 1 when s=1, r=0");

    // Test 3: Reset state
    s = 0; r = 1; 
    #10;
    if (q !== 0) $display("FAIL: q should be 0 when s=0, r=1");

    // Test 4: Indeterminate state
    s = 1; r = 1; 
    #10;
    if (q !== 1'bx) $display("FAIL: q should be indeterminate (1'bx) when s=1, r=1");

    // Test 5: Hold state again
    s = 0; r = 0; 
    #10;
    if (q !== 1'bx) $display("FAIL: q should remain indeterminate (1'bx) when s=0, r=0");

    // Test 6: Reset after indeterminate state
    rst = 1; 
    #10; // Wait for reset
    if (q !== 0) $display("FAIL: q should be 0 after reset from indeterminate state");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule