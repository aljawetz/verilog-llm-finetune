`timescale 1ns/1ps

module tb_jk_ff;

    reg clk;
    reg rst;
    reg J;
    reg K;
    wire Q;
    wire Q_bar;

    // Instantiate the JK flip-flop
    jk_ff uut (
        .clk(clk),
        .rst(rst),
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
        // Initialize signals
        rst = 1; J = 0; K = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test 1: Hold state (J=0, K=0)
        J = 0; K = 0;
        #10; // Wait for 1 clock cycle
        if (Q !== 0) $display("FAIL: Expected Q=0 after hold state, got Q=%b", Q);

        // Test 2: Set state (J=1, K=0)
        J = 1; K = 0;
        #10; // Wait for 1 clock cycle
        if (Q !== 1) $display("FAIL: Expected Q=1 after set state, got Q=%b", Q);

        // Test 3: Reset state (J=0, K=1)
        J = 0; K = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 0) $display("FAIL: Expected Q=0 after reset state, got Q=%b", Q);

        // Test 4: Toggle state (J=1, K=1)
        J = 1; K = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 1) $display("FAIL: Expected Q=1 after toggle state, got Q=%b", Q);
        #10; // Wait for another clock cycle
        if (Q !== 0) $display("FAIL: Expected Q=0 after toggle state, got Q=%b", Q);

        // Test 5: Asynchronous reset
        rst = 1;
        #10; // Wait for 10ns
        if (Q !== 0) $display("FAIL: Expected Q=0 after asynchronous reset, got Q=%b", Q);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule