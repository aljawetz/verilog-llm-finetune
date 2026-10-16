`timescale 1ns/1ps

module tb_JK_flipflop;
    reg clk;
    reg rst;
    reg J;
    reg K;
    wire q;
    wire q_bar;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .clk(clk),
        .rst(rst),
        .J(J),
        .K(K),
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
        // Initialize
        rst = 1; J = 0; K = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: J=0, K=0 (no change)
        #10; // Wait for clock
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: J=0, K=1 (reset)
        J = 0; K = 1;
        #10; // Wait for clock
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: J=1, K=0 (set)
        J = 1; K = 0;
        #10; // Wait for clock
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: J=1, K=1 (toggle)
        J = 1; K = 1;
        #10; // Wait for clock
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10; // Wait for clock
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 5: J=0, K=0 (no change)
        J = 0; K = 0;
        #10; // Wait for clock
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 6: Reset
        rst = 1;
        #10; // Wait for clock
        rst = 0; // Release reset
        #10; // Wait for clock
        if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule