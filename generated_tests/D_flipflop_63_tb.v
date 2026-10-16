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
        reset = 1; d = 0;
        #10; // Wait for 10ns

        // Test reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Release reset
        reset = 0;
        #10; // Wait for 10ns

        // Test D input capture
        d = 1; #10; // Wait for 10ns
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        d = 0; #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // Test reset during operation
        reset = 1; #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test normal operation after reset
        reset = 0; d = 1; #10; // Wait for 10ns
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end

        d = 0; #10; // Wait for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule