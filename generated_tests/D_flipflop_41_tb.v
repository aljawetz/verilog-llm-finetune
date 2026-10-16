`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        d = 0;

        // Test 1: Check reset functionality
        #10; // Wait for a clock edge
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Check D input functionality
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Test 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test 4: Check reset again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 5: Check D input with reset deasserted
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule