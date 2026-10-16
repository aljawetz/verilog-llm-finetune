`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK flip-flop
    jkff uut (
        .j(j),
        .k(k),
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
        // Initialize inputs
        j = 0; k = 0; reset = 1; // Start with reset active
        #10;

        // Check reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test J=0, K=0 (no change)
        j = 0; k = 0;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not maintain its value when J=0, K=0");
            $finish;
        end

        // Test J=0, K=1 (clear)
        j = 0; k = 1;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not clear to 0 when J=0, K=1");
            $finish;
        end

        // Test J=1, K=0 (set)
        j = 1; k = 0;
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end

        // Test J=1, K=1 (toggle)
        j = 1; k = 1;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle correctly when J=1, K=1");
            $finish;
        end

        // Toggle again
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle correctly on second toggle when J=1, K=1");
            $finish;
        end

        // Test J=0, K=0 again (no change)
        j = 0; k = 0;
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not maintain its value when J=0, K=0 after toggling");
            $finish;
        end

        // Test reset again
        reset = 1;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule