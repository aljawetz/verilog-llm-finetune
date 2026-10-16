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
        reset = 1; #10; // Hold reset for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Set d to 1 and clock
        reset = 0; d = 1; #10; // Clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not capture d on clock edge");
            $finish;
        end

        // Test 3: Change d to 0 and clock
        d = 0; #10; // Clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not capture d on clock edge");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; #10; // Hold reset for 10ns
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 5: Check Q after reset is released
        reset = 0; d = 1; #10; // Clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not capture d on clock edge after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule