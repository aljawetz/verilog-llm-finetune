`timescale 1ns/1ps

module tb_fsm_1011;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test
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

        // Test sequence to check the FSM behavior
        // Check initial state
        if (y !== 0) begin
            $display("FAIL: Initial output y should be 0");
            $finish;
        end

        // Input sequence: 1, 0, 1, 1
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

        din = 0; #10; // Move back to S2
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2 after returning");
            $finish;
        end

        // Additional checks
        din = 1; #10; // Move to S3
        din = 1; #10; // Move to S4
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4 again");
            $finish;
        end

        din = 0; #10; // Move back to S2
        if (y !== 0) begin
            $display("FAIL: Output y should be 0 in state S2 after returning");
            $finish;
        end

        // Final check
        din = 1; #10; // Move to S3
        din = 0; #10; // Move back to S2
        din = 1; #10; // Move to S3
        din = 1; #10; // Move to S4
        if (y !== 1) begin
            $display("FAIL: Output y should be 1 in state S4");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule