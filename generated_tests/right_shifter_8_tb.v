`timescale 1ns/1ps

module tb_right_shifter;

// Inputs
reg clk;
reg d;

// Outputs
wire [7:0] q;

// Instantiate the Unit Under Test (UUT)
right_shifter uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    d = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Shift in 1
    d = 1; #10;
    if (q !== 8'b10000000) $display("FAIL: Test case 1 failed, expected 10000000, got %b", q);

    // Test case 2: Shift in 0
    d = 0; #10;
    if (q !== 8'b01000000) $display("FAIL: Test case 2 failed, expected 01000000, got %b", q);

    // Test case 3: Shift in 1 again
    d = 1; #10;
    if (q !== 8'b10100000) $display("FAIL: Test case 3 failed, expected 10100000, got %b", q);

    // Test case 4: Shift in 0
    d = 0; #10;
    if (q !== 8'b01010000) $display("FAIL: Test case 4 failed, expected 01010000, got %b", q);

    // Test case 5: Shift in 1
    d = 1; #10;
    if (q !== 8'b10101000) $display("FAIL: Test case 5 failed, expected 10101000, got %b", q);

    // Test case 6: Shift in 0
    d = 0; #10;
    if (q !== 8'b01010100) $display("FAIL: Test case 6 failed, expected 01010100, got %b", q);

    // Test case 7: Shift in 1
    d = 1; #10;
    if (q !== 8'b10101010) $display("FAIL: Test case 7 failed, expected 10101010, got %b", q);

    // Test case 8: Shift in 0
    d = 0; #10;
    if (q !== 8'b01010101) $display("FAIL: Test case 8 failed, expected 01010101, got %b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule