`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    tff uut (
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
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: Toggle Q when t is high
        t = 1; // Set T to toggle
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when T is high");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle back to 0 when T is high");
            $finish;
        end

        // Test case 3: Q should remain the same when t is low
        t = 0; // Set T to hold
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q changed when T is low");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q changed when T is low");
            $finish;
        end

        // Test case 4: Toggle Q again with t high
        t = 1; // Set T to toggle
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when T is high");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle back to 0 when T is high");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule