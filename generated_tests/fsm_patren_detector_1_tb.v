`timescale 1ns/1ps

module tb_fsm_patren_detector;

reg in;
reg clk;
reg reset;
wire out;

// Instantiate the module under test (uut)
fsm_patren_detector uut (
    .in(in),
    .reset(reset),
    .clk(clk),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test case 1: Input sequence does not match pattern
    in = 0; #10; // S0
    in = 1; #10; // S1
    in = 1; #10; // S1
    in = 0; #10; // S1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // Test case 2: Input sequence matches pattern "0-1-0-1"
    in = 0; #10; // S0
    in = 1; #10; // S1
    in = 0; #10; // S2
    in = 1; #10; // S3
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // Test case 3: Input sequence does not match pattern after detection
    in = 0; #10; // S2
    in = 1; #10; // S1
    in = 1; #10; // S1
    if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

    // Test case 4: Reset the FSM
    reset = 1; #10; // Reset state
    reset = 0; 
    in = 0; #10; // S0
    if (out !== 0) $display("FAIL: Expected out=0 after reset, got out=%b", out);

    // Test case 5: Valid pattern again
    in = 0; #10; // S0
    in = 1; #10; // S1
    in = 0; #10; // S2
    in = 1; #10; // S3
    if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule