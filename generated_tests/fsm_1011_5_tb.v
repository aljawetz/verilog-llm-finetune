`timescale 1ns/1ps

module tb_fsm_1011;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test (uut)
    fsm_1011 uut (
        .clk(clk),
        .rst(rst),
        .din(din),
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
        #10; // Wait for a clock cycle
        rst = 0;

        // Test sequence to detect 1011
        // Expected output y = 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S0 -> S1
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 0; #10; // S1 -> S2
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S2 -> S3
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S3 -> S4
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        din = 0; #10; // S4 -> S2
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        din = 1; #10; // S2 -> S3
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S3 -> S4
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        din = 0; #10; // S4 -> S2
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // Reset the FSM
        rst = 1; #10;
        rst = 0; #10;

        // Final test to ensure FSM resets correctly
        din = 1; #10; // S0 -> S1
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 0; #10; // S1 -> S2
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S2 -> S3
        if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        din = 1; #10; // S3 -> S4
        if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule