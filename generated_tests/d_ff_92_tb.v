`timescale 1ns/1ps

module tb_d_ff;

    reg in;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in = 0;
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        rst = 0; // Deassert reset
        #10; // Wait for one clock cycle

        // Test 2: Check D flip-flop behavior
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1");
            $finish;
        end

        in = 0; // Set input to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0");
            $finish;
        end

        // Test 3: Check reset during operation
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 during operation");
            $finish;
        end

        // Final check
        rst = 0; // Deassert reset
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule