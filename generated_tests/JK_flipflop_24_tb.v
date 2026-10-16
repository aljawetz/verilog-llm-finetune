`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
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
        // Initialize inputs
        j = 0; k = 0; reset = 1; 
        #10; // Wait for 10ns

        // Test asynchronous reset
        reset = 0; // Release reset
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test J = 0, K = 0 (no change)
        j = 0; k = 0; 
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when J=0, K=0");
            $finish;
        end

        // Test J = 0, K = 1 (reset)
        j = 0; k = 1; 
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when J=0, K=1");
            $finish;
        end

        // Test J = 1, K = 0 (set)
        j = 1; k = 0; 
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when J=1, K=0");
            $finish;
        end

        // Test J = 1, K = 1 (toggle)
        j = 1; k = 1; 
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggle when previous Q=1");
            $finish;
        end

        // Toggle again
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggle when previous Q=0");
            $finish;
        end

        // Test J = 0, K = 0 (no change)
        j = 0; k = 0; 
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when J=0, K=0");
            $finish;
        end

        // Test reset again
        reset = 1; 
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule