`timescale 1ns/1ps

module tb_T_flipflop;

    reg clk;
    reg rst;
    reg T;
    wire q;
    wire q_bar;

    // Instantiate the T_flipflop module
    T_flipflop uut (
        .clk(clk),
        .rst(rst),
        .T(T),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        T = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, q should remain the same
        T = 0;
        #10;
        if (q !== 0) $display("FAIL: Expected q = 0, got q = %b", q);

        // Test case 2: T = 1, q should toggle
        T = 1;
        #10;
        if (q !== 1) $display("FAIL: Expected q = 1, got q = %b", q);

        // Test case 3: T = 1, q should toggle again
        #10;
        if (q !== 0) $display("FAIL: Expected q = 0, got q = %b", q);

        // Test case 4: Assert q_bar is correct
        if (q_bar !== 1) $display("FAIL: Expected q_bar = 1, got q_bar = %b", q_bar);

        // Test case 5: Reset the flip-flop
        rst = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q = 0 after reset, got q = %b", q);
        if (q_bar !== 1) $display("FAIL: Expected q_bar = 1 after reset, got q_bar = %b", q_bar);

        // Test case 6: Release reset and toggle
        rst = 0;
        T = 1;
        #10;
        if (q !== 1) $display("FAIL: Expected q = 1 after toggle, got q = %b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule