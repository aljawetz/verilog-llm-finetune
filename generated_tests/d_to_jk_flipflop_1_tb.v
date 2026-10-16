`timescale 1ns/1ps

module tb_d_to_jk_flipflop;

    reg j;
    reg k;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    d_to_jk_flipflop uut (
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
        j = 0;
        k = 0;
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Test case 1: Reset functionality
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: J=1, K=0 (Set Q to 1)
        j = 1; k = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end

        // Test case 3: J=0, K=1 (Reset Q to 0)
        j = 0; k = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q did not reset to 0 when J=0, K=1");
            $finish;
        end

        // Test case 4: J=1, K=1 (Toggle Q)
        j = 1; k = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q did not toggle to 1 when J=1, K=1");
            $finish;
        end
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q did not toggle to 0 when J=1, K=1");
            $finish;
        end

        // Test case 5: Check stable state
        j = 0; k = 0; // Hold state
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q changed unexpectedly when J=0, K=0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule