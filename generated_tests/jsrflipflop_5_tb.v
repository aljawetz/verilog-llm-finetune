`timescale 1ns/1ps

module tb_jsrflipflop;
    reg clk;
    reg rst;
    reg [1:0] sr;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
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
        // Initialize signals
        rst = 1;
        sr = 2'b00;
        #10; // Wait for a clock edge

        // Release reset
        rst = 0;
        #10;

        // Test hold (sr = 00)
        sr = 2'b00; // Hold
        #10;
        if (q !== 0) $display("FAIL: Hold failed, expected q=0, got q=%b", q);

        // Test reset (sr = 01)
        sr = 2'b01; // Reset
        #10;
        if (q !== 0) $display("FAIL: Reset failed, expected q=0, got q=%b", q);

        // Test set (sr = 10)
        sr = 2'b10; // Set
        #10;
        if (q !== 1) $display("FAIL: Set failed, expected q=1, got q=%b", q);

        // Test indeterminate (sr = 11)
        sr = 2'b11; // Indeterminate
        #10;
        if (q !== 1'bx) $display("FAIL: Indeterminate failed, expected q=x, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule