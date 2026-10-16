`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q)
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
        rst = 0;

        // Test 1: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        rst = 0; // Deassert reset
        #10; // Wait for a clock edge

        // Test 2: Check D input functionality
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to D value");
            $finish;
        end

        // Test 3: Check D input functionality with different value
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to D value");
            $finish;
        end

        // Test 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Check D input functionality after reset
        rst = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to D value after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule