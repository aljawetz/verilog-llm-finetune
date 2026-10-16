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
        reset = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end
        
        reset = 0; // Deassert reset
        #10; // Wait for one clock cycle

        // Test 2: Check D input functionality
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D value 1");
            $finish;
        end

        // Test 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D value 0");
            $finish;
        end

        // Test 4: Check multiple clock cycles
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D value 1");
            $finish;
        end
        
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D value 0");
            $finish;
        end

        // Test 5: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule