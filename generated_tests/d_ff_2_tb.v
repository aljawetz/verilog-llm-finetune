`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg in;
    reg clk;
    reg rst;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .in(in),
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
        // Initialize inputs
        in = 0;
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check D flip-flop functionality
        rst = 0; // Deassert reset
        in = 1; // Set input
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not match input in after clock edge");
            $finish;
        end

        // Test 3: Change input and check output
        in = 0; // Change input
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not match input in after clock edge");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Check behavior after reset
        rst = 0; // Deassert reset
        in = 1; // Set input
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not match input in after clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule