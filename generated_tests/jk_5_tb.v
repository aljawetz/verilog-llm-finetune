`timescale 1ns/1ps

module tb_jk;

reg j, k, clk, rst;
wire q;

// Instantiate the module under test (uut)
jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
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
    j = 0; k = 0; rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: Reset state
    #10;
    if (q !== 0) begin
        $display("FAIL: Initial state after reset is not 0");
        $finish;
    end

    // Test case 2: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q=1 when j=1, k=0");
        $finish;
    end

    // Test case 3: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when j=0, k=1");
        $finish;
    end

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q=1 when j=1, k=1 (toggle from 0)");
        $finish;
    end

    // Test case 5: Toggle state (j=1, k=1)
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when j=1, k=1 (toggle from 1)");
        $finish;
    end

    // Test case 6: Hold state (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when j=0, k=0 (hold)");
        $finish;
    end

    // Test case 7: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q=1 when j=1, k=0");
        $finish;
    end

    // Test case 8: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when j=0, k=1");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule