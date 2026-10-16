`timescale 1ns/1ps

module tb_mealy_011_detector;

    reg clk;
    reg reset_n;
    reg x;
    wire y;

    // Instantiate the module under test (uut)
    mealy_011_detector uut (
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
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
        reset_n = 0;
        x = 0;

        // Apply reset
        #10;
        reset_n = 1;

        // Test sequence to detect "011"
        // Input: 0
        #10; x = 0; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 0
        #10; x = 0; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 0
        #10; x = 0; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 1 (detected "011")
        #10; if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // Input: 0
        #10; x = 0; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 0
        #10; x = 0; // y should be 0
        #10; if (y !== 0) $display("FAIL: Expected y=0, got y=%b", y);

        // Input: 1
        #10; x = 1; // y should be 1 (detected "011")
        #10; if (y !== 1) $display("FAIL: Expected y=1, got y=%b", y);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule