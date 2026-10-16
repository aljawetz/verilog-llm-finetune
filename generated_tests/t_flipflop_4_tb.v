`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    t_flipflop uut (
        .t(t),
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
        reset = 1;
        t = 0;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: T = 0, Q should remain unchanged
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggle");
            $finish;
        end

        // Test case 3: T = 0, Q should remain unchanged
        t = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggle");
            $finish;
        end

        // Test case 5: Reset should set Q to 0
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 6: T = 1, Q should toggle
        reset = 0;
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggle");
            $finish;
        end

        // Test case 7: T = 0, Q should remain unchanged
        t = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 8: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggle");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule