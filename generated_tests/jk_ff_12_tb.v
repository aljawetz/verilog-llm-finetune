`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg rst_n;
reg j;
reg k;
wire q;
wire q_bar;

// Instantiate the module under test
jk_ff uut (
    .clk(clk),
    .rst_n(rst_n),
    .j(j),
    .k(k),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst_n = 0; // Assert reset
    j = 0;
    k = 0;
    #10; // Wait for 10ns

    // Release reset
    rst_n = 1;
    #10;

    // Test case 1: J=0, K=0 (no change)
    j = 0; k = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

    // Test case 2: J=0, K=1 (reset)
    j = 0; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: J=1, K=0 (set)
    j = 1; k = 0;
    #10;
    if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

    // Test case 4: J=1, K=1 (toggle)
    j = 1; k = 1;
    #10;
    if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
    
    // Toggle again
    #10;
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Test case 5: Assert reset again
    rst_n = 0;
    #10;
    if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0 after reset, got q=%b", q);

    // End of tests
    $display("PASS");
    $finish;
end

endmodule