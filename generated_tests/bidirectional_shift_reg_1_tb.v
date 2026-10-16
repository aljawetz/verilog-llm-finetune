`timescale 1ns/1ps

module tb_bidirectional_shift_reg;

parameter N = 3;
reg d;
reg en;
reg dir;
reg clk;
reg rst;
wire [N-1:0] Q;

bidirectional_shift_reg #(N) uut (
    .d(d),
    .en(en),
    .dir(dir),
    .clk(clk),
    .rst(rst),
    .Q(Q)
);

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    en = 0;
    d = 0;
    dir = 0;

    // Release reset
    #5 rst = 0;

    // Test sequence
    // Test 1: Shift left with en = 1
    en = 1; dir = 0; d = 1; #10; // Q should be 001
    if (Q !== 3'b001) $display("FAIL: Expected Q = 001, got Q = %b", Q);

    // Test 2: Shift left with en = 1
    d = 1; #10; // Q should be 011
    if (Q !== 3'b011) $display("FAIL: Expected Q = 011, got Q = %b", Q);

    // Test 3: Shift right with en = 1
    dir = 1; d = 0; #10; // Q should be 101
    if (Q !== 3'b101) $display("FAIL: Expected Q = 101, got Q = %b", Q);

    // Test 4: Shift right with en = 1
    d = 1; #10; // Q should be 110
    if (Q !== 3'b110) $display("FAIL: Expected Q = 110, got Q = %b", Q);

    // Test 5: Reset functionality
    rst = 1; #5; // Reset the register
    if (Q !== 3'b000) $display("FAIL: Expected Q = 000 after reset, got Q = %b", Q);
    rst = 0;

    // Test 6: Shift left with en = 1 after reset
    en = 1; dir = 0; d = 1; #10; // Q should be 001
    if (Q !== 3'b001) $display("FAIL: Expected Q = 001, got Q = %b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule