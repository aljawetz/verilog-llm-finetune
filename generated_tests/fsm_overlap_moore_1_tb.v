`timescale 1ns/1ps

module tb_fsm_overlap_moore;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test (uut)
    fsm_overlap_moore uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        din = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence
        // Check initial state
        if (y !== 0) begin
            $display("FAIL: Initial output y should be 0");
            $finish;
        end

        // Input sequence: 1, 0, 1, 1, 0
        din = 1; #10; // Move to S1
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S1");
            $finish;
        end

        din = 0; #10; // Move to S2
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2");
            $finish;
        end

        din = 1; #10; // Move to S3
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S3");
            $finish;
        end

        din = 1; #10; // Move to S4
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4");
            $finish;
        end

        din = 0; #10; // Move to S2
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2");
            $finish;
        end

        // Additional checks to ensure state transitions
        din = 1; #10; // Move to S3
        din = 1; #10; // Move to S4
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4");
            $finish;
        end

        // Reset the FSM
        rst = 1; #10; // Assert reset
        rst = 0; #10; // Deassert reset

        // Final check after reset
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 after reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule