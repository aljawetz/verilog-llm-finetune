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
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check Q follows d when reset is not active
        d = 1; #10; // Q should be 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is 0");
            $finish;
        end

        // Test case 2: Check Q follows d
        d = 0; #10; // Q should be 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is 0");
            $finish;
        end

        // Test case 3: Assert reset functionality
        reset = 1; #10; // Q should be 0 due to reset
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when reset is 1");
            $finish;
        end

        // Test case 4: Check Q follows d after reset is released
        reset = 0; d = 1; #10; // Q should be 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is 0");
            $finish;
        end

        // Test case 5: Check Q follows d again
        d = 0; #10; // Q should be 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule