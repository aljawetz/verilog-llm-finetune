`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T flip-flop
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
        #10; // Wait for a clock cycle
        
        // Release reset
        reset = 0;
        #10; // Wait for a clock cycle

        // Test case 1: T = 0, Q should remain unchanged
        t = 0;
        #10; // Wait for a clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 and reset is inactive");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should toggle to 1 when T is 1");
            $finish;
        end

        // Test case 3: T = 0, Q should remain unchanged
        t = 0;
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1;
        #10; // Wait for a clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should toggle to 0 when T is 1");
            $finish;
        end

        // Test case 5: Assert reset functionality
        reset = 1;
        #10; // Wait for a clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be reset to 0 when reset is active");
            $finish;
        end

        // Test case 6: Release reset and toggle
        reset = 0;
        t = 1;
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should toggle to 1 after reset is released and T is 1");
            $finish;
        end

        // Test case 7: T = 0, Q should remain unchanged
        t = 0;
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule