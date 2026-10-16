`timescale 1ns/1ps

module tb_d_ff_fsm;

    reg d_in;
    reg clk;
    reg reset_n;
    wire d_out;

    // Instantiate the module under test (uut)
    d_ff_fsm uut (
        .d_in(d_in),
        .clk(clk),
        .reset_n(reset_n),
        .d_out(d_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d_in = 0;
        reset_n = 0; // Assert reset

        // Wait for a few clock cycles
        #10;
        reset_n = 1; // Deassert reset
        #10;

        // Test state transitions
        d_in = 0; // Stay in state s0
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Expected d_out = 0 in state s0");
            $finish;
        end

        d_in = 1; // Transition to state s1
        #10;
        if (d_out !== 1) begin
            $display("FAIL: Expected d_out = 1 in state s1");
            $finish;
        end

        d_in = 0; // Transition back to state s0
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Expected d_out = 0 in state s0 after d_in = 0");
            $finish;
        end

        // Test reset functionality
        reset_n = 0; // Assert reset
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Expected d_out = 0 after reset");
            $finish;
        end

        reset_n = 1; // Deassert reset
        #10;

        // Final checks
        d_in = 1; // Go to state s1
        #10;
        if (d_out !== 1) begin
            $display("FAIL: Expected d_out = 1 after d_in = 1");
            $finish;
        end

        d_in = 0; // Go back to state s0
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Expected d_out = 0 after d_in = 0");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule