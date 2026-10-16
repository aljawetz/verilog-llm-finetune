`timescale 1ns/1ps

module tb_moore_nonoverlap;

    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test (uut)
    moore_nonoverlap uut (
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
        // Initialize inputs
        rst = 1;
        din = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence
        // State s0
        #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s0, got y=%b", y);

        // Transition to s1
        din = 1; #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s1, got y=%b", y);

        // Transition to s2
        din = 0; #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s2, got y=%b", y);

        // Transition to s3
        din = 1; #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s3, got y=%b", y);

        // Transition to s4
        din = 0; #10; 
        if (y !== 1) $display("FAIL: Expected y=1 in state s4, got y=%b", y);

        // Transition back to s0
        din = 0; #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s0 after transition, got y=%b", y);

        // Transition to s1 again
        din = 1; #10; 
        if (y !== 0) $display("FAIL: Expected y=0 in state s1, got y=%b", y);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule