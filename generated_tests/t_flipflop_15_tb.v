`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
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

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: Toggle Q when t is high
        t = 1; // Set t high
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when t is high");
            $finish;
        end

        #10;   // Wait for another clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle to 0 when t is high again");
            $finish;
        end

        // Test case 3: Q should remain unchanged when t is low
        t = 0; // Set t low
        #10;   // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q changed when t is low");
            $finish;
        end

        // Test case 4: Check toggle functionality again
        t = 1; // Set t high
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when t is high again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule