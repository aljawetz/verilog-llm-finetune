`timescale 1ns/1ps

module tb_mealy;

    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test (uut)
    mealy uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .y(y)
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
        din = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence to detect "101"
        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1 (This should trigger y=1)
        din = 1; #10;
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // Input: 0 (Back to state S2)
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1 (This should trigger y=1 again)
        din = 1; #10;
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // End of test
        $display("PASS");
        $finish;
    end

endmodule