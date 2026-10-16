`timescale 1ns/1ps

module tb_fsm_pair_detect;

reg ser_in;
reg clk;
reg rst;
wire det;

// Instantiate the module under test
fsm_pair_detect uut (
    .ser_in(ser_in),
    .clk(clk),
    .rst(rst),
    .det(det)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    ser_in = 0;
    rst = 1;

    // Apply reset
    #10;
    rst = 0;

    // Test sequence to detect the pair pattern
    // State transitions: 00 -> 01 -> 11 (detected) -> 01 -> 10 -> 11 (detected)
    
    // First pattern: 1, 1 (should detect)
    ser_in = 1; #10;
    if (det !== 0) $display("FAIL: det should be 0 after reset");
    
    ser_in = 1; #10;
    if (det !== 1) $display("FAIL: det should be 1 after detecting 1, 1");

    // Transition to state 01
    ser_in = 0; #10;
    if (det !== 0) $display("FAIL: det should be 0 after detecting 1, 0");

    // Transition to state 10
    ser_in = 1; #10;
    if (det !== 1) $display("FAIL: det should be 1 after detecting 0, 1");

    // Transition to state 01
    ser_in = 0; #10;
    if (det !== 0) $display("FAIL: det should be 0 after detecting 1, 0");

    // Transition to state 11 (should detect)
    ser_in = 1; #10;
    if (det !== 1) $display("FAIL: det should be 1 after detecting 0, 1");

    // End of test
    $display("PASS");
    $finish;
end

endmodule