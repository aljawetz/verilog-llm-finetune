`timescale 1ns/1ps

module tb_jk_ff;
    reg clk;
    reg J;
    reg K;
    wire Q;
    wire Q_bar;

    // Instantiate the jk_ff module
    jk_ff uut (
        .clk(clk),
        .J(J),
        .K(K),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        J = 0; K = 0; #10; // Hold state
        if (Q !== 0 || Q_bar !== 1) $display("FAIL: Initial state incorrect");

        // Test J=0, K=1 (Clear)
        J = 0; K = 1; #10;
        if (Q !== 0 || Q_bar !== 1) $display("FAIL: J=0, K=1 failed");

        // Test J=1, K=0 (Set)
        J = 1; K = 0; #10;
        if (Q !== 1 || Q_bar !== 0) $display("FAIL: J=1, K=0 failed");

        // Test J=1, K=1 (Toggle)
        J = 1; K = 1; #10;
        if (Q !== 0 || Q_bar !== 1) $display("FAIL: J=1, K=1 first toggle failed");
        #10;
        if (Q !== 1 || Q_bar !== 0) $display("FAIL: J=1, K=1 second toggle failed");

        // Test J=0, K=0 (Hold state)
        J = 0; K = 0; #10;
        if (Q !== 1 || Q_bar !== 0) $display("FAIL: J=0, K=0 failed");

        // Final check to ensure Q holds
        #10;
        if (Q !== 1 || Q_bar !== 0) $display("FAIL: Final state incorrect");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule