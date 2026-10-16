`timescale 1ns/1ps

module tb_D_flipflop;

    reg d;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .d(d),
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
        d = 0;
        reset = 1; // Assert reset
        #10; // Wait for 10ns

        // Check reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Deassert reset
        reset = 0;
        #10; // Wait for 10ns

        // Test case 1: Set d = 1
        d = 1;
        #10; // Wait for 10ns
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        // Test case 2: Set d = 0
        d = 0;
        #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // Test case 3: Assert reset again
        reset = 1;
        #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule