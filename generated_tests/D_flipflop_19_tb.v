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
        reset = 1;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: Check D flip-flop behavior
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D (expected 1)");
            $finish;
        end

        // Test case 3: Change D input
        d = 0; 
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not follow D (expected 0)");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 5: Check D flip-flop behavior after reset
        reset = 0; 
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D after reset (expected 1)");
            $finish;
        end

        // Test case 6: Final check with D = 0
        d = 0; 
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not follow D (expected 0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule