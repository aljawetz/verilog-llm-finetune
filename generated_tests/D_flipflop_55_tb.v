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

        // Test 1: Reset functionality
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Check D input propagation
        reset = 0; // Deactivate reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D when reset is inactive");
            $finish;
        end

        // Test 3: Check D input propagation with different value
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D when reset is inactive");
            $finish;
        end

        // Test 4: Check reset functionality again
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // Test 5: Check D input propagation after reset
        reset = 0; // Deactivate reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D after reset is deactivated");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule