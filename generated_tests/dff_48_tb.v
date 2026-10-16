`timescale 1ns/1ps

module tb_dff;

    reg din;
    reg clk;
    reg rst;
    wire qout;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .qout(qout),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        din = 0;
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set qout to 0 and qbar to 1");
            $finish;
        end
        
        // Deassert reset
        rst = 0;
        #10; // Wait for one clock cycle

        // Test 2: Check D flip-flop functionality
        din = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (qout !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: D flip-flop did not set qout to 1 and qbar to 0");
            $finish;
        end

        din = 0; // Change input to 0
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: D flip-flop did not set qout to 0 and qbar to 1");
            $finish;
        end

        // Test 3: Check reset during operation
        din = 1; // Set input to 1
        #10; // Wait for one clock cycle
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset during operation did not set qout to 0 and qbar to 1");
            $finish;
        end

        // Test 4: Check normal operation after reset
        rst = 0; // Deassert reset
        din = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (qout !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: D flip-flop did not set qout to 1 and qbar to 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule