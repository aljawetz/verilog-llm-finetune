`timescale 1ns/1ps

module tb_seq_detector_010110;

    reg clk;
    reg rst;
    reg d_in;
    wire y_out;

    // Instantiate the module under test (uut)
    seq_detector_010110 uut (
        .clk(clk),
        .rst(rst),
        .d_in(d_in),
        .y_out(y_out)
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
        d_in = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence to detect 010110
        // Expected output y_out should be high after the last '0' in the sequence
        // Input: 0
        d_in = 0; #10; // State: IDLE -> S1
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S1 -> S2
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 0
        d_in = 0; #10; // State: S2 -> S3
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S3 -> S4
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S4 -> S5
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 0
        d_in = 0; #10; // State: S5 -> IDLE, y_out should be high
        if (y_out !== 1) $display("FAIL: Expected y_out = 1, got %b", y_out);

        // Reset the state
        rst = 1; #10;
        rst = 0;

        // Input: 0
        d_in = 0; #10; // State: IDLE -> S1
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S1 -> S2
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 0
        d_in = 0; #10; // State: S2 -> S3
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S3 -> S4
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 1
        d_in = 1; #10; // State: S4 -> S5
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Input: 0
        d_in = 0; #10; // State: S5 -> IDLE, y_out should be high
        if (y_out !== 1) $display("FAIL: Expected y_out = 1, got %b", y_out);

        // Final reset
        rst = 1; #10;
        rst = 0;

        // Input: 1
        d_in = 1; #10; // State: IDLE -> IDLE
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule