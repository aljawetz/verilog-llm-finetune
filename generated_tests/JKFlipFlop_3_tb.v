`timescale 1ns/1ps

module tb_JKFlipFlop;

    reg J;
    reg K;
    reg clk;
    reg reset;
    wire Q;
    wire Qb;

    // Instantiate the JKFlipFlop module
    JKFlipFlop uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qb(Qb),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        J = 0;
        K = 0;
        #10; // Wait for a clock cycle
        reset = 0;

        // Test 1: Hold state (J=0, K=0)
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test 2: Reset state (J=0, K=1)
        J = 0; K = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test 3: Set state (J=1, K=0)
        J = 1; K = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test 4: Toggle state (J=1, K=1)
        J = 1; K = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test 5: Asynchronous reset
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule