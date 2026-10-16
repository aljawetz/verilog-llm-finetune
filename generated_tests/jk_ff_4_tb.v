`timescale 1ns/1ps

module tb_jk_ff;

reg j;
reg k;
reg clk;
wire q;

// Instantiate the jk_ff module
jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
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
    j = 0; k = 0;
    #10; // Wait for 1 clock cycle

    // Test hold state (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test reset state (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test set state (j=1, k=0)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test toggle state (j=1, k=1)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q); // toggled from 1 to 0

    // Toggle again
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q); // toggled from 0 to 1

    // Test hold state again (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test reset state again (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test set state again (j=1, k=0)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule