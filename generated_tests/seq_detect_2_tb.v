`timescale 1ns/1ps

module tb_seq_detect;

reg D_IN;
reg CLK;
reg RST;
wire MATCH;

// Instantiate the module under test
seq_detect uut (
    .D_IN(D_IN),
    .CLK(CLK),
    .RST(RST),
    .MATCH(MATCH)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    RST = 1;
    D_IN = 0;
    #10; // Wait for reset to take effect
    RST = 0;

    // Test sequence for detecting "1010101"
    // Expected output: MATCH should be high after the last '1'
    
    // Input sequence: 1
    D_IN = 1; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 1");

    // Input sequence: 0
    D_IN = 0; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 0");

    // Input sequence: 1
    D_IN = 1; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 1");

    // Input sequence: 0
    D_IN = 0; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 0");

    // Input sequence: 1
    D_IN = 1; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 1");

    // Input sequence: 0
    D_IN = 0; #10;
    if (MATCH !== 0) $display("FAIL: MATCH should be 0 after input 0");

    // Input sequence: 1
    D_IN = 1; #10;
    if (MATCH !== 1) $display("FAIL: MATCH should be 1 after input 1");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule