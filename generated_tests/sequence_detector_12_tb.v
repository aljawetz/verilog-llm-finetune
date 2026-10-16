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
        #10; // Wait for a clock cycle
        rst = 0;

        // Test sequence: 1, 0, 1 -> should detect sequence and set Z1
        X = 1; #10; // S0 -> S1
        X = 0; #10; // S1 -> S2
        X = 1; #10; // S2 -> S3, Z1 should be 1
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 after detecting sequence 101");
            $finish;
        end

        // Reset the detector
        rst = 1; #10; rst = 0;

        // Test sequence: 1, 0, 0 -> should not detect sequence
        X = 1; #10; // S0 -> S1
        X = 0; #10; // S1 -> S2
        X = 0; #10; // S2 -> S0, Z1 should be 0
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 after sequence 100");
            $finish;
        end

        // Reset the detector
        rst = 1; #10; rst = 0;

        // Test sequence: 1, 0, 1, 1 -> should detect sequence and set Z1 again
        X = 1; #10; // S0 -> S1
        X = 0; #10; // S1 -> S2
        X = 1; #10; // S2 -> S3, Z1 should be 1
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 after detecting sequence 101");
            $finish;
        end

        // Check if Z1 goes low after the sequence
        #10; // Wait for next clock cycle
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 after the sequence is complete");
            $finish;
        end

        // Final reset and check
        rst = 1; #10; rst = 0;

        // End of test
        $display("PASS");
        $finish;
    end
endmodule