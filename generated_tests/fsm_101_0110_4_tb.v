`timescale 1ns/1ps

module tb_fsm_101_0110;

    reg din;
    reg clk;
    reg reset;
    wire y;

    // Instantiate the module under test
    fsm_101_0110 uut (
        .din(din),
        .clk(clk),
        .reset(reset),
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
        reset = 1;
        din = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test pattern "101"
        din = 1; #10; // S0 -> S1
        din = 0; #10; // S1 -> S3 (y should be 0)
        din = 1; #10; // S3 -> S4 (y should be 1)
        if (y !== 1'b1) $display("FAIL: Expected y=1 at time %0t", $time);
        
        // Reset and test pattern "0110"
        reset = 1; #10;
        reset = 0; #10;

        din = 0; #10; // S0 -> S2
        din = 1; #10; // S2 -> S4
        din = 1; #10; // S4 -> S5 (y should be 0)
        din = 0; #10; // S5 -> S3 (y should be 1)
        if (y !== 1'b1) $display("FAIL: Expected y=1 at time %0t", $time);
        
        // Reset and test pattern "1010110"
        reset = 1; #10;
        reset = 0; #10;

        din = 1; #10; // S0 -> S1
        din = 0; #10; // S1 -> S3
        din = 1; #10; // S3 -> S4
        din = 1; #10; // S4 -> S5
        din = 0; #10; // S5 -> S3
        din = 1; #10; // S3 -> S4 (y should be 1)
        if (y !== 1'b1) $display("FAIL: Expected y=1 at time %0t", $time);

        // Final reset
        reset = 1; #10;
        $display("PASS");
        $finish;
    end

endmodule