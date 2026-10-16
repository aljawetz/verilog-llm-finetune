`timescale 1ns/1ps

module tb_moore_nonoverlap;

    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test
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
        din = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;

        // Test sequence to detect non-overlapping pattern "010"
        // Expected output y should be high only when the sequence "010" is detected

        // State s0
        #10; din = 0; // Stay in s0, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s0");

        // State s0 -> s1
        #10; din = 1; // Move to s1, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // State s1 -> s2
        #10; din = 0; // Move to s2, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s2");

        // State s2 -> s3
        #10; din = 1; // Move to s3, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // State s3 -> s4
        #10; din = 0; // Move to s4, y should be 1
        #10; if (y !== 1) $display("FAIL: Expected y=1 in state s4");

        // State s4 -> s0
        #10; din = 1; // Move to s1, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 after returning to s1");

        // State s1 -> s1
        #10; din = 1; // Stay in s1, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // State s1 -> s2
        #10; din = 0; // Move to s2, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s2");

        // State s2 -> s3
        #10; din = 1; // Move to s3, y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // State s3 -> s4
        #10; din = 0; // Move to s4, y should be 1
        #10; if (y !== 1) $display("FAIL: Expected y=1 in state s4");

        // End of test
        #10;
        $display("PASS");
        $finish;
    end

endmodule