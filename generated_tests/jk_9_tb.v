`timescale 1ns/1ps

module tb_jk;

reg j;
reg k;
reg clk;
wire q;
wire qn;

// Instantiate the JK flip-flop
jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qn(qn)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    j = 0;
    k = 0;

    // Wait for the clock to stabilize
    #10;

    // Test case 1: Hold state (00)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 2: Reset (01)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 3: Set (10)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 4: Toggle (11)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 5: Reset again (01)
    j = 0; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 6: Hold state (00)
    j = 0; k = 0; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

    // Test case 7: Set (10)
    j = 1; k = 0; #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // Test case 8: Toggle (11)
    j = 1; k = 1; #10;
    if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
    #10;
    if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule