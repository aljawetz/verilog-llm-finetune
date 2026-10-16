`timescale 1ns/1ps

module tb_T_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T_flipflop module
    T_flipflop uut (
        .t(t),
        .clk(clk),
        .reset(reset),
        .Q(Q)
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
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test Case 1: Check reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test Case 2: Toggle Q when t is high
        t = 1; // Set T high
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after toggling");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test Case 3: Hold Q when t is low
        t = 0; // Set T low
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should remain 0 when T is low");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should remain 0 when T is low");
            $finish;
        end

        // Test Case 4: Toggle Q again with t high
        t = 1; // Set T high
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after toggling");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test Case 5: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule