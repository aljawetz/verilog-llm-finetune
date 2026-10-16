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
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence: 1, 0, 1 -> should output Z1 = 1
        X = 1; #10; // State S0 -> S1
        X = 0; #10; // State S1 -> S2
        X = 1; #10; // State S2 -> S3
        if (Z1 !== 1) begin
            $display("FAIL: Expected Z1 = 1 after sequence 101");
            $finish;
        end

        // Reset and test another sequence: 0, 1, 0 -> should not output Z1
        rst = 1; #10;
        rst = 0;
        X = 0; #10; // State S0
        X = 1; #10; // State S0 -> S1
        X = 0; #10; // State S1 -> S2
        if (Z1 !== 0) begin
            $display("FAIL: Expected Z1 = 0 after sequence 010");
            $finish;
        end

        // Test sequence: 1, 0, 1, 1 -> should output Z1 = 1 again
        X = 1; #10; // State S2 -> S3
        if (Z1 !== 1) begin
            $display("FAIL: Expected Z1 = 1 after sequence 1011");
            $finish;
        end

        // Reset and test another sequence: 1, 1, 0 -> should not output Z1
        rst = 1; #10;
        rst = 0;
        X = 1; #10; // State S0 -> S1
        X = 1; #10; // State S1 stays in S1
        X = 0; #10; // State S1 -> S2
        if (Z1 !== 0) begin
            $display("FAIL: Expected Z1 = 0 after sequence 110");
            $finish;
        end

        // Final reset and check
        rst = 1; #10;
        rst = 0;
        X = 0; #10; // State S0
        if (Z1 !== 0) begin
            $display("FAIL: Expected Z1 = 0 after reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule