`timescale 1ns/1ps

module tb_ticker;

    // Parameters
    reg clk;
    reg reset;
    wire tick;

    // Instantiate the module under test (uut)
    ticker uut (
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Test 1: Check initial state
        if (uut.count !== 20'b0) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Test 2: Increment count and check tick signal
        for (integer i = 0; i < 999999; i = i + 1) begin
            #10; // Wait for one clock cycle
        end

        // Check if tick is high after reaching 999999
        if (tick !== 1) begin
            $display("FAIL: Tick signal is not high at count 999999");
            $finish;
        end

        // Test 3: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        reset = 0; // Deassert reset

        // Check if count is reset to zero
        if (uut.count !== 20'b0) begin
            $display("FAIL: Count is not zero after reset");
            $finish;
        end

        // Test 4: Ensure tick is low after reset
        #10; // Wait for one clock cycle
        if (tick !== 0) begin
            $display("FAIL: Tick signal is not low after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule