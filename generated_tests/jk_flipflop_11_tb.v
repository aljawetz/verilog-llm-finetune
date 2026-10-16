`timescale 1ns/1ps

module tb_jk_flipflop;

reg j;
reg k;
reg clk;
reg rst;
wire q;
wire qb;

// Instantiate the JK Flip-Flop
jk_flipflop uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qb(qb)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1; // Start with reset
    j = 0;
    k = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test 1: Hold state (j=0, k=0)
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after hold state, got q=%b", q);
        $finish;
    end

    // Test 2: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q=1 after set state, got q=%b", q);
        $finish;
    end

    // Test 3: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after reset state, got q=%b", q);
        $finish;
    end

    // Test 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q=1 after first toggle, got q=%b", q);
        $finish;
    end

    // Toggle again
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after second toggle, got q=%b", q);
        $finish;
    end

    // Final check: Hold state again
    j = 0; k = 0;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after hold state, got q=%b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule