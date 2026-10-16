`timescale 1ns/1ps

module tb_dual_edge_trig_ff;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the dual_edge_trig_ff module
    dual_edge_trig_ff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for a clock cycle

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for two clock edges
        if (q !== 1) begin
            $display("FAIL: Expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for two clock edges
        if (q !== 0) begin
            $display("FAIL: Expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 3: Reset the flip-flop
        reset = 1;
        #10; // Wait for a clock edge
        reset = 0;
        #10; // Wait for two clock edges
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 after reset, got q = %b", q);
            $finish;
        end

        // Test case 4: Set d to 1 again
        d = 1;
        #10; // Wait for two clock edges
        if (q !== 1) begin
            $display("FAIL: Expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 5: Set d to 0 again
        d = 0;
        #10; // Wait for two clock edges
        if (q !== 0) begin
            $display("FAIL: Expected q = 0, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule