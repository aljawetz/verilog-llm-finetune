`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg d;
    reg reset;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .d(d),
        .reset(reset),
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
        reset = 0;
        d = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear q to 0");
            $finish;
        end

        // Test 2: Check D flip-flop functionality
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to D value (expected 1)");
            $finish;
        end

        // Test 3: Change D value
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to D value (expected 0)");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear q to 0");
            $finish;
        end

        // Test 5: Check D value after reset
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to D value (expected 1)");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule