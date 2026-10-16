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
        // Initialize signals
        reset = 0;
        d = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Check D input transfer
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D when reset is deasserted");
            $finish;
        end

        // Test 3: Check D input transfer with different value
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not follow D when D is set to 0");
            $finish;
        end

        // Test 4: Check reset functionality again
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 on second assertion");
            $finish;
        end

        // Test 5: Check D input transfer after reset
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D after reset was deasserted");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule