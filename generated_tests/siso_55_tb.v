`timescale 1ns/1ps

module tb_siso;

reg reset;
reg clk;
reg di;
wire do;

siso uut (
    .reset(reset),
    .clk(clk),
    .di(di),
    .do(do)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    di = 0;

    // Apply reset
    reset = 1;
    #5;
    reset = 0;

    // Test sequence
    // Shift in bits 1, 0, 1, 1
    di = 1; #10; // Clock 1
    if (do !== 0) $display("FAIL: Output should be 0 after reset");
    
    di = 0; #10; // Clock 0
    if (do !== 1) $display("FAIL: Output should be 1 after shifting in 1");
    
    di = 1; #10; // Clock 1
    if (do !== 0) $display("FAIL: Output should be 0 after shifting in 0");
    
    di = 1; #10; // Clock 1
    if (do !== 1) $display("FAIL: Output should be 1 after shifting in 1");
    
    di = 0; #10; // Clock 0
    if (do !== 1) $display("FAIL: Output should be 1 after shifting in 1");
    
    // Reset the module
    reset = 1; #5;
    reset = 0; #10;
    if (do !== 0) $display("FAIL: Output should be 0 after reset");

    // Shift in bits 0, 1, 0, 1
    di = 0; #10; // Clock 0
    if (do !== 0) $display("FAIL: Output should be 0 after shifting in 0");
    
    di = 1; #10; // Clock 1
    if (do !== 0) $display("FAIL: Output should be 0 after shifting in 0");
    
    di = 0; #10; // Clock 0
    if (do !== 1) $display("FAIL: Output should be 1 after shifting in 1");
    
    di = 1; #10; // Clock 1
    if (do !== 0) $display("FAIL: Output should be 0 after shifting in 0");

    // Final reset check
    reset = 1; #5;
    reset = 0; #10;
    if (do !== 0) $display("FAIL: Output should be 0 after reset");

    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule