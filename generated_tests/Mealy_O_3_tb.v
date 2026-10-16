`timescale 1ns/1ps

module tb_Mealy_O;

reg in;
reg clk;
reg rst;
wire out;

// Instantiate the module under test
Mealy_O uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    in = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test sequence to detect "1010"
    // Expected output: out should be high when "1010" is detected
    // State transitions:
    // s0 -> s1 (in=1)
    // s1 -> s10 (in=0)
    // s10 -> s101 (in=1)
    // s101 -> s10 (in=0) -> out=1 (detected "1010")
    
    // Test case 1: Input "1010"
    in = 1; #10; // s0 -> s1
    if (out !== 0) $display("FAIL: Expected out=0 at state s1");
    
    in = 0; #10; // s1 -> s10
    if (out !== 0) $display("FAIL: Expected out=0 at state s10");
    
    in = 1; #10; // s10 -> s101
    if (out !== 0) $display("FAIL: Expected out=0 at state s101");
    
    in = 0; #10; // s101 -> s10
    if (out !== 1) $display("FAIL: Expected out=1 after detecting '1010'");
    
    // Test case 2: Input "1010" again
    in = 1; #10; // s10 -> s1
    if (out !== 0) $display("FAIL: Expected out=0 at state s1");
    
    in = 0; #10; // s1 -> s10
    if (out !== 0) $display("FAIL: Expected out=0 at state s10");
    
    in = 1; #10; // s10 -> s101
    if (out !== 0) $display("FAIL: Expected out=0 at state s101");
    
    in = 0; #10; // s101 -> s10
    if (out !== 1) $display("FAIL: Expected out=1 after detecting '1010'");

    // Test case 3: Input "1110" (should not detect)
    in = 1; #10; // s0 -> s1
    in = 1; #10; // s1 -> s1
    in = 1; #10; // s1 -> s1
    in = 0; #10; // s1 -> s10
    if (out !== 0) $display("FAIL: Expected out=0 after input '1110'");

    // Test case 4: Reset the FSM
    rst = 1; #10; // Assert reset
    rst = 0; #10; // Release reset

    // Final check: Input "0000" (should not detect)
    in = 0; #10; // s0 -> s0
    if (out !== 0) $display("FAIL: Expected out=0 at state s0");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule