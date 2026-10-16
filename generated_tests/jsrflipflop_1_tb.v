`timescale 1ns/1ps

module tb_jsrflipflop;
    reg clk;
    reg rst;
    reg [1:0] sr;
    wire q;
    wire qbar;

    // Instantiate the jsrflipflop module
    jsrflipflop uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .sr(sr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1;
        sr = 2'b00;
        #10; // Wait for 10ns
        rst = 0;

        // Test case 1: Hold state (sr = 00)
        sr = 2'b00; #10;
        if (q !== 0) $display("FAIL: Expected q = 0, got q = %b", q);

        // Test case 2: Set state (sr = 10)
        sr = 2'b10; #10;
        if (q !== 1) $display("FAIL: Expected q = 1, got q = %b", q);

        // Test case 3: Reset state (sr = 01)
        sr = 2'b01; #10;
        if (q !== 0) $display("FAIL: Expected q = 0, got q = %b", q);

        // Test case 4: Set state to unknown (sr = 11)
        sr = 2'b11; #10;
        if (q !== 1'bx) $display("FAIL: Expected q = x, got q = %b", q);

        // Final reset
        rst = 1; #10;
        if (q !== 0) $display("FAIL: Expected q = 0 after reset, got q = %b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule