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
        // Initialize inputs
        d = 0;
        reset = 0;

        // Test 1: Check reset functionality
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Check D input when reset is inactive
        reset = 0; // Deactivate reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D input when reset is inactive");
            $finish;
        end

        // Test 3: Check D input changes
        d = 0; // Change D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not follow D input after change");
            $finish;
        end

        // Test 4: Check reset functionality again
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 on second check");
            $finish;
        end

        // Test 5: Check D input after reset
        reset = 0; // Deactivate reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D input after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule