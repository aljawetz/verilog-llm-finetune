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
        reset = 1;
        d = 0;

        // Apply reset
        #10;
        reset = 0; // Release reset

        // Test case 1: Check Q after setting d
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is not active");
            $finish;
        end

        // Test case 2: Check Q after changing d
        d = 0; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is not active");
            $finish;
        end

        // Test case 3: Check reset functionality
        reset = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when reset is active");
            $finish;
        end

        // Test case 4: Check Q after releasing reset
        reset = 0; 
        d = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is not active");
            $finish;
        end

        // Test case 5: Final check with reset again
        reset = 1; 
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when reset is active");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule