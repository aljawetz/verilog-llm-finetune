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

        // Test sequence: 1, 0, 1
        // Expected Z1 = 0
        X = 1; #10; // Move to S1
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 in state S1");
            $finish;
        end

        X = 0; #10; // Move to S2
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 in state S2");
            $finish;
        end

        X = 1; #10; // Move to S3
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 in state S3");
            $finish;
        end

        // Next cycle should return to S1
        X = 0; #10; // Move to S1
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 in state S1 after transition from S3");
            $finish;
        end

        // Additional test sequences
        // Test sequence: 1, 1, 0, 1
        X = 1; #10; // Move to S1
        X = 1; #10; // Stay in S1
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 in state S1");
            $finish;
        end

        X = 0; #10; // Move to S2
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 in state S2");
            $finish;
        end

        X = 1; #10; // Move to S3
        if (Z1 !== 1) begin
            $display("FAIL: Z1 should be 1 in state S3");
            $finish;
        end

        // Reset the FSM
        rst = 1; #10; // Apply reset
        rst = 0; #10; // Release reset

        // Final check: Ensure FSM is in initial state
        if (Z1 !== 0) begin
            $display("FAIL: Z1 should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule