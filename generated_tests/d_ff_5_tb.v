`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
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
        d = 0;
        reset = 0;

        // Test 1: Reset the flip-flop
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        reset = 0; // Deassert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check D input capture
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not capture D input (expected 1)");
            $finish;
        end

        // Test 3: Change D input
        d = 0; // Change D to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not capture D input (expected 0)");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Check D input after reset
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not capture D input (expected 1 after reset)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule