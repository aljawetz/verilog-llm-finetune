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
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is active");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Set d to 1
        d = 1;
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is not active");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is not active");
            $finish;
        end

        // Test case 3: Assert reset again
        reset = 1;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is active");
            $finish;
        end

        // Test case 4: Release reset and set d to 1
        reset = 0;
        d = 1;
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is not active");
            $finish;
        end

        // Test case 5: Change d to 0
        d = 0;
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is not active");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule