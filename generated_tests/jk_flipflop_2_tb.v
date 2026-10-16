`timescale 1ns/1ps

module tb_jk_flipflop;

reg j, k, clk, reset;
wire Q, Q_bar;

// Instantiate the module under test (uut)
jk_flipflop uut (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
    .Q(Q),
    .Q_bar(Q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    j = 0; k = 0; reset = 1; // Start with reset high
    #10; // Wait for 10ns

    // Release reset
    reset = 0; 
    #10; // Wait for 10ns

    // Test case 1: J=0, K=0 (hold state)
    j = 0; k = 0; 
    #10; // Wait for 10ns
    if (Q !== 0 || Q_bar !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: J=0, K=1 (reset state)
    j = 0; k = 1; 
    #10; // Wait for 10ns
    if (Q !== 0 || Q_bar !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: J=1, K=0 (set state)
    j = 1; k = 0; 
    #10; // Wait for 10ns
    if (Q !== 1 || Q_bar !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: J=1, K=1 (toggle state)
    j = 1; k = 1; 
    #10; // Wait for 10ns
    if (Q !== 0 || Q_bar !== 1) $display("FAIL: Test case 4 failed");
    
    // Toggle again
    #10; // Wait for 10ns
    if (Q !== 1 || Q_bar !== 0) $display("FAIL: Test case 4 failed on toggle");

    // Test case 5: Reset the flip-flop
    reset = 1; 
    #10; // Wait for 10ns
    if (Q !== 0 || Q_bar !== 1) $display("FAIL: Reset failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule