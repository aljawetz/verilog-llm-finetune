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

        // Test sequence: 1, 0, 1
        // Expected Z1 = 0
        #10 X = 1; // State S0 -> S1
        #10 X = 0; // State S1 -> S2
        #10 X = 1; // State S2 -> S3
        #10; // Check Z1
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 after sequence 1, 0, 1");
            $finish;
        end

        // Reset and check
        #10 rst = 1; // Reset
        #10 rst = 0; // Release reset

        // Test sequence: 1, 0, 1, 0
        // Expected Z1 = 0
        #10 X = 1; // State S0 -> S1
        #10 X = 0; // State S1 -> S2
        #10 X = 1; // State S2 -> S3
        #10; // Check Z1
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 after sequence 1, 0, 1");
            $finish;
        end

        #10 X = 0; // State S3 -> S1
        #10; // Check Z1
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 after transition to S1");
            $finish;
        end

        // Test sequence: 1, 1, 0, 1
        // Expected Z1 = 0
        #10 X = 1; // State S1 -> S1
        #10 X = 0; // State S1 -> S2
        #10 X = 1; // State S2 -> S3
        #10; // Check Z1
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 after sequence 1, 0, 1");
            $finish;
        end

        // Final reset
        #10 rst = 1; // Reset
        #10 rst = 0; // Release reset

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule