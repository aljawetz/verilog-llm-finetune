`timescale 1ns/1ps

module tb_D_flipflop;

    reg d;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
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
        d = 0;
        reset = 1; // Start with reset active
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test 1: Check Q after setting d
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        // Test 2: Check Q after changing d
        d = 0; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // Test 3: Check reset functionality
        reset = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when reset is active");
            $finish;
        end

        // Test 4: Check Q after reset is released
        reset = 0; 
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 after reset");
            $finish;
        end

        // Test 5: Final check with d = 0
        d = 0; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule