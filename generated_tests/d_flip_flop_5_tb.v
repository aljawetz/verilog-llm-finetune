`timescale 1ns/1ps

module tb_d_flip_flop;

    reg d;
    reg clk;
    reg reset;
    wire q;
    wire q_bar;

    // Instantiate the D flip-flop
    d_flip_flop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q),
        .q_bar(q_bar)
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
        reset = 0;

        // Test 1: Reset the flip-flop
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        reset = 0; // Deassert reset
        #10;

        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1");
            $finish;
        end

        // Test 2: Check D input propagation
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test 3: Check D input propagation with 0
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        reset = 0; // Deassert reset
        #10;

        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule