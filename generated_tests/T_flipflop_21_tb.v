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

        // Wait for a few clock cycles
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: T = 0, Q should remain the same
        t = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T=0 and reset is active");
            $finish;
        end

        // Test case 2: Set T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        t = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T=0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling with T=1");
            $finish;
        end

        // Test case 5: Reset the flip-flop
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 6: Release reset and toggle
        reset = 0;
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1 after reset");
            $finish;
        end

        // Final check: T = 0, Q should remain the same
        t = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T=0 after toggling");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule