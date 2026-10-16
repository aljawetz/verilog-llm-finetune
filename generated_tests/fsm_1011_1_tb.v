`timescale 1ns/1ps

module tb_fsm_1011;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test (uut)
    fsm_1011 uut (
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
        // Initialize inputs
        rst = 1;
        din = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence to detect 1011
        // Expected output y should be 0 initially
        if (y !== 0) begin
            $display("FAIL: Initial output y should be 0");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S1, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S1");
            $finish;
        end

        // Input sequence: 0
        din = 0; #10;
        // State S2, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S3, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S3");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S4, y should be 1 (sequence 1011 detected)
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4");
            $finish;
        end

        // Input sequence: 0
        din = 0; #10;
        // Back to state S2, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 after detecting sequence");
            $finish;
        end

        // Reset the FSM
        rst = 1; #10;
        rst = 0; #10;

        // Check after reset, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 after reset");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S1, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S1 after reset");
            $finish;
        end

        // Input sequence: 0
        din = 0; #10;
        // State S2, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2 after reset");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S3, y should be 0
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S3 after reset");
            $finish;
        end

        // Input sequence: 1
        din = 1; #10;
        // State S4, y should be 1 (sequence 1011 detected)
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4 after reset");
            $finish;
        end

        // Final output check
        $display("PASS");
        $finish;
    end

endmodule