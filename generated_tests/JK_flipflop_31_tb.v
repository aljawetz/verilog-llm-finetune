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
        // Initialize signals
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test 1: Check reset functionality
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Set Q to 1 (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q did not set to 1 when j=1, k=0");
            $finish;
        end

        // Test 3: Clear Q to 0 (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q did not clear to 0 when j=0, k=1");
            $finish;
        end

        // Test 4: Maintain Q (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q changed when j=0, k=0");
            $finish;
        end

        // Test 5: Toggle Q (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q did not toggle when j=1, k=1");
            $finish;
        end
        
        // Toggle again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q did not toggle back when j=1, k=1");
            $finish;
        end

        // Final check: Reset again
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule