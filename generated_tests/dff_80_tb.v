`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D Flip-Flop
    dff uut (
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

        // Wait for a clock edge
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Check Q follows d
        d = 1; #10; // Q should be 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        // Test case 2: Check Q holds value
        #10; // Q should still be 1
        if (Q !== 1) begin
            $display("FAIL: Q should still be 1");
            $finish;
        end

        // Test case 3: Change d to 0
        d = 0; #10; // Q should be 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // Test case 4: Reset the flip-flop
        reset = 1; #10; // Q should be 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 5: Release reset and set d to 1
        reset = 0; d = 1; #10; // Q should be 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after reset is released and d is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule