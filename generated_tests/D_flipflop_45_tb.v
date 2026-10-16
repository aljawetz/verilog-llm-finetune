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
        reset = 1; #10; // Hold reset high for 10ns
        reset = 0; #10; // Release reset
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Set d to 1 and clock
        d = 1; #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after clocking d=1");
            $finish;
        end

        // Test 3: Set d to 0 and clock
        d = 0; #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after clocking d=0");
            $finish;
        end

        // Test 4: Reset again
        reset = 1; #10; // Hold reset high for 10ns
        reset = 0; #10; // Release reset
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 5: Check if Q follows d
        d = 1; #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after clocking d=1");
            $finish;
        end

        d = 0; #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after clocking d=0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule