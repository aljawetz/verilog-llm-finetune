`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK flip-flop
    jkff uut (
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

        // Test case 1: Reset functionality
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: J=0, K=0 (no change)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when J=0, K=0");
            $finish;
        end

        // Test case 3: J=0, K=1 (reset Q to 0)
        j = 0; k = 1;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when J=0, K=1");
            $finish;
        end

        // Test case 4: J=1, K=0 (set Q to 1)
        j = 1; k = 0;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when J=1, K=0");
            $finish;
        end

        // Test case 5: J=1, K=1 (toggle Q)
        j = 1; k = 1;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggle when J=1, K=1");
            $finish;
        end

        // Test case 6: J=1, K=1 (toggle Q again)
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggle when J=1, K=1");
            $finish;
        end

        // Test case 7: J=0, K=0 (no change)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when J=0, K=0");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule