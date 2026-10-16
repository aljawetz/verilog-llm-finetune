`timescale 1ns/1ps

module tb_JKFlipFlop;

    reg J, K, clk, reset;
    wire Q, Qb;

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
        // Initialize inputs
        reset = 1; J = 0; K = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: Hold state (J=0, K=0)
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 2: Reset state (J=0, K=1)
        J = 0; K = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 3: Set state (J=1, K=0)
        J = 1; K = 0;
        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 4: Toggle state (J=1, K=1)
        J = 1; K = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end
        
        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 5: Asynchronous reset
        reset = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // Final check for Qb
        if (Qb !== 1) begin
            $display("FAIL: Expected Qb=1, got Qb=%b", Qb);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule