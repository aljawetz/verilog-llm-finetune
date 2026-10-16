`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg clr;
reg J;
reg K;
wire q;

// Instantiate the jk_ff module
jk_ff uut (
    .clk(clk),
    .clr(clr),
    .J(J),
    .K(K),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize
    clr = 1; J = 0; K = 0; 
    #10; // Wait for a clock edge
    if (q !== 1'b1) $display("FAIL: Initial value is not 1");
    
    // Test clear functionality
    clr = 0; 
    #10; // Wait for a clock edge
    if (q !== 1'b0) $display("FAIL: Output not cleared to 0 when clr is low");
    
    // Test set functionality
    clr = 1; J = 1; K = 0; 
    #10; // Wait for a clock edge
    if (q !== 1'b1) $display("FAIL: Output not set to 1 when J=1, K=0");
    
    // Test reset functionality
    clr = 1; J = 0; K = 1; 
    #10; // Wait for a clock edge
    if (q !== 1'b0) $display("FAIL: Output not reset to 0 when J=0, K=1");
    
    // Test toggle functionality
    clr = 1; J = 1; K = 1; 
    #10; // Wait for a clock edge
    if (q !== 1'b1) $display("FAIL: Output not toggled to 1 when J=1, K=1 (first toggle)");
    
    #10; // Wait for a clock edge
    if (q !== 1'b0) $display("FAIL: Output not toggled to 0 when J=1, K=1 (second toggle)");
    
    #10; // Wait for a clock edge
    if (q !== 1'b1) $display("FAIL: Output not toggled to 1 when J=1, K=1 (third toggle)");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule