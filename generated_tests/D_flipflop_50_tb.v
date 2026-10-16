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

        // Wait for a clock edge
        #10;

        // Test case 1: Reset should set Q to 0
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is high");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test case 2: Set d to 1 and check Q
        d = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is low");
            $finish;
        end

        // Test case 3: Set d to 0 and check Q
        d = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is low");
            $finish;
        end

        // Test case 4: Assert reset again
        reset = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is high again");
            $finish;
        end

        // Test case 5: Release reset and set d to 1
        reset = 0;
        d = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is low");
            $finish;
        end

        // Test case 6: Release reset and set d to 0
        d = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is low");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule