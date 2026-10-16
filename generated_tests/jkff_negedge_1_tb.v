`timescale 1ns/1ps

module tb_jkff_negedge;

reg j, k, clk, rst;
wire q, qb;

// Instantiate the module under test (uut)
jkff_negedge uut (
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
    j = 0; k = 0; rst = 1; // Start with reset
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test hold condition
    j = 0; k = 0; // Hold
    #10;
    if (q !== 0) begin
        $display("FAIL: Hold condition failed");
        $finish;
    end

    // Test set condition
    j = 1; k = 0; // Set
    #10;
    if (q !== 1) begin
        $display("FAIL: Set condition failed");
        $finish;
    end

    // Test reset condition
    j = 0; k = 1; // Reset
    #10;
    if (q !== 0) begin
        $display("FAIL: Reset condition failed");
        $finish;
    end

    // Test toggle condition
    j = 1; k = 1; // Toggle
    #10;
    if (q !== 1) begin
        $display("FAIL: Toggle condition failed on first toggle");
        $finish;
    end

    // Toggle again
    #10;
    if (q !== 0) begin
        $display("FAIL: Toggle condition failed on second toggle");
        $finish;
    end

    // Final check for qb
    if (qb !== 1) begin
        $display("FAIL: qb output incorrect");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule