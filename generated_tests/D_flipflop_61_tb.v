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

        // Test 1: Reset the flip-flop
        reset = 1; #10; // Assert reset
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        reset = 0; #10; // Deassert reset

        // Test 2: Check D input propagation
        d = 1; #10; // Set D to 1
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        d = 0; #10; // Set D to 0
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test 3: Check reset during operation
        d = 1; #10; // Set D to 1
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        reset = 1; #10; // Assert reset
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 4: Check D input propagation after reset
        reset = 0; #10; // Deassert reset
        d = 1; #10; // Set D to 1
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1 after reset");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule