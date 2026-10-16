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

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 and reset is deasserted");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1 on first toggle");
            $finish;
        end

        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after second toggle");
            $finish;
        end

        // Test case 3: T = 0, Q should remain 0
        t = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1 on toggle");
            $finish;
        end

        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after second toggle");
            $finish;
        end

        // Test case 5: Assert reset, Q should be 0
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 6: Deassert reset, T = 1, Q should toggle
        reset = 0;
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after reset deasserted and T is 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule