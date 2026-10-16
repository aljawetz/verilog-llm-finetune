`timescale 1ns/1ps

module tb_sequence_detector;
    reg clk;
    reg rst;
    reg X;
    wire Z1;

    // Instantiate the module under test (uut)
    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .X(X),
        .Z1(Z1)
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
        X = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence: 101
        // Expected output Z1 should be high after the sequence is detected
        #10 X = 1; // S0 -> S1
        #10 X = 0; // S1 -> S2
        #10 X = 1; // S2 -> S3, Z1 should be 1
        #10; // Wait to observe Z1
        if (uut.Z1 !== 1) begin
            $display("FAIL: Z1 should be high after detecting 101");
            $finish;
        end

        // Reset and test another sequence
        #10 rst = 1; // Asynchronous reset
        #10 rst = 0; // Release reset

        // Test sequence: 1001 (should not trigger Z1)
        #10 X = 1; // S0 -> S1
        #10 X = 0; // S1 -> S2
        #10 X = 0; // S2 -> S0
        #10 X = 1; // S0 -> S1
        #10; // Wait to observe Z1
        if (uut.Z1 !== 0) begin
            $display("FAIL: Z1 should be low after sequence 1001");
            $finish;
        end

        // Test sequence: 101 again
        #10 X = 1; // S0 -> S1
        #10 X = 0; // S1 -> S2
        #10 X = 1; // S2 -> S3, Z1 should be 1
        #10; // Wait to observe Z1
        if (uut.Z1 !== 1) begin
            $display("FAIL: Z1 should be high after detecting 101 again");
            $finish;
        end

        // Final reset and check
        #10 rst = 1; // Asynchronous reset
        #10 rst = 0; // Release reset
        #10; // Wait to observe Z1
        if (uut.Z1 !== 0) begin
            $display("FAIL: Z1 should be low after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule