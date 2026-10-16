`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
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
        d = 0;

        // Wait for a few clock cycles
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check Q when d = 0
        d = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // Test case 2: Check Q when d = 1
        d = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        // Test case 3: Check reset functionality
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: Check Q after reset is released
        reset = 0;
        d = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 after reset");
            $finish;
        end

        // Test case 5: Check Q when d changes to 0
        d = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0 after being 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule