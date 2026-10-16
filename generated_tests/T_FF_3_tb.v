`timescale 1ns/1ps

module tb_T_FF;

    reg clock;
    reg rst;
    reg t;
    wire q;
    wire q_bar;

    // Instantiate the T_FF module
    T_FF uut (
        .clock(clock),
        .rst(rst),
        .t(t),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for a clock edge

        // Check reset functionality
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for a clock edge

        // Check initial state after reset
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test toggling
        t = 1; // Set T to toggle
        #10; // Wait for a clock edge

        // Check toggled state
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Toggling did not work as expected");
            $finish;
        end

        // Toggle again
        #10; // Wait for a clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Second toggle did not work as expected");
            $finish;
        end

        // Test holding state
        t = 0; // Set T to hold
        #10; // Wait for a clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Holding state did not work as expected");
            $finish;
        end

        // Test reset during toggling
        t = 1; // Set T to toggle
        #10; // Wait for a clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Toggling did not work as expected before reset");
            $finish;
        end

        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1 during toggling");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule