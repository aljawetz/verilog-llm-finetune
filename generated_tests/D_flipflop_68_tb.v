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

        // Test reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is high");
            $finish;
        end

        // Release reset
        reset = 0;
        #10; // Wait for 10ns

        // Test D input functionality
        d = 1;
        #10; // Wait for 10ns
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 and reset is low");
            $finish;
        end

        // Change D input
        d = 0;
        #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0 and reset is low");
            $finish;
        end

        // Test reset functionality again
        reset = 1;
        #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is high again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule