`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T flip-flop
    t_flipflop uut (
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
        #10; // Wait for a clock edge
        reset = 0; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: Toggle Q when t is high
        t = 1; // Set t high
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after toggling");
            $finish;
        end

        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test case 3: No toggle when t is low
        t = 0; // Set t low
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should remain 0 when t is low");
            $finish;
        end

        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should remain 0 when t is low");
            $finish;
        end

        // Test case 4: Toggle again with t high
        t = 1; // Set t high
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after toggling");
            $finish;
        end

        // Test case 5: Reset while t is high
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset while t is high");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule