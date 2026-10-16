`timescale 1ns/1ps

module tb_sequence_detector;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
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
        in = 0;
        #10; // Wait for a clock cycle
        reset = 0;

        // Test sequence for detecting 1011
        // Expected output: out should be high after the sequence is detected
        // Input sequence: 1, 0, 1, 1
        #10 in = 1; // S0 -> S1
        #10 in = 0; // S1 -> S2
        #10 in = 1; // S2 -> S3
        #10 in = 1; // S3 -> S4
        #10; // Wait for output to stabilize

        if (uut.out !== 1) begin
            $display("FAIL: Expected output high after detecting 1011");
            $finish;
        end

        // Reset the FSM
        #10 reset = 1;
        #10 reset = 0;

        // Test sequence for not detecting 1011
        // Input sequence: 0, 0, 0, 1
        #10 in = 0; // S0 -> S0
        #10 in = 0; // S0 -> S0
        #10 in = 0; // S0 -> S0
        #10 in = 1; // S0 -> S1
        #10; // Wait for output to stabilize

        if (uut.out !== 0) begin
            $display("FAIL: Expected output low when sequence not detected");
            $finish;
        end

        // Test sequence for detecting 1011 again
        // Input sequence: 1, 0, 1, 1
        #10 in = 1; // S0 -> S1
        #10 in = 0; // S1 -> S2
        #10 in = 1; // S2 -> S3
        #10 in = 1; // S3 -> S4
        #10; // Wait for output to stabilize

        if (uut.out !== 1) begin
            $display("FAIL: Expected output high after detecting 1011 again");
            $finish;
        end

        // Final reset
        #10 reset = 1;
        #10 reset = 0;

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule