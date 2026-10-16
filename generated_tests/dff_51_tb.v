`timescale 1ns/1ps

module tb_dff;
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .d(d)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Assert reset
        d = 0;
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Check D input functionality
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not set q to 1 and qbar to 0");
            $finish;
        end

        // Test 3: Check D input functionality with D = 0
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D input did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 5: Check D input functionality after reset
        rst = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not set q to 1 and qbar to 0 after reset");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule